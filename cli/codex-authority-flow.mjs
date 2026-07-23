#!/usr/bin/env node
import { existsSync } from 'node:fs';
import { homedir, platform } from 'node:os';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawnSync } from 'node:child_process';

const VERSION = '1.0.0';
const here = dirname(fileURLToPath(import.meta.url));
const root = resolve(here, '..');
const command = (process.argv[2] || 'install').toLowerCase();

function executableExists(name) {
  const checker = platform() === 'win32' ? 'where' : 'command';
  const args = platform() === 'win32' ? [name] : ['-v', name];
  return spawnSync(checker, args, { shell: platform() !== 'win32', stdio: 'ignore' }).status === 0;
}

function runInstall() {
  if (!executableExists('git')) {
    console.error('Erro: Git não foi encontrado. Instale o Git e execute novamente.');
    process.exit(1);
  }

  if (platform() === 'win32') {
    const shell = executableExists('pwsh') ? 'pwsh' : 'powershell';
    const script = join(root, 'scripts', 'install.ps1');
    const result = spawnSync(shell, ['-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', script], {
      stdio: 'inherit',
      cwd: root,
    });
    process.exit(result.status ?? 1);
  }

  const script = join(root, 'scripts', 'install.sh');
  const result = spawnSync('bash', [script], { stdio: 'inherit', cwd: root });
  process.exit(result.status ?? 1);
}

function doctor() {
  const skillsDir = process.env.CODEX_SKILLS_DIR || join(homedir(), '.agents', 'skills');
  const agentsFile = process.env.CODEX_GLOBAL_AGENTS || join(homedir(), '.codex', 'AGENTS.md');
  const authoritySkill = join(skillsDir, 'codex-authority-flow', 'SKILL.md');
  const checks = [
    ['Node.js >= 18', Number(process.versions.node.split('.')[0]) >= 18],
    ['Git disponível', executableExists('git')],
    ['Pacote contém SKILL.md', existsSync(join(root, 'skill', 'SKILL.md'))],
    ['Skill instalada', existsSync(authoritySkill)],
    ['AGENTS.md global', existsSync(agentsFile)],
  ];

  console.log(`Codex Authority Flow v${VERSION}`);
  for (const [label, ok] of checks) console.log(`${ok ? '✓' : '✗'} ${label}`);
  console.log(`Skills: ${skillsDir}`);
  console.log(`AGENTS: ${agentsFile}`);

  if (!checks[1][1] || !checks[2][1]) process.exit(1);
}

switch (command) {
  case 'install':
  case 'update':
    runInstall();
    break;
  case 'doctor':
    doctor();
    break;
  case 'version':
  case '--version':
  case '-v':
    console.log(VERSION);
    break;
  case 'help':
  case '--help':
  case '-h':
    console.log(`Codex Authority Flow v${VERSION}\n\nComandos:\n  install   Instala ou atualiza a skill e suas dependências\n  update    Igual a install\n  doctor    Verifica dependências e instalação\n  version   Mostra a versão`);
    break;
  default:
    console.error(`Comando desconhecido: ${command}`);
    process.exit(2);
}
