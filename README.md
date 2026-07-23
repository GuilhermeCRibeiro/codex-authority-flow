# Codex Authority Flow

Skill de autoridade para o Codex criada para **GuilhermeCRibeiro**. Ela entende e aplica automaticamente o fluxo completo de engenharia: classificação, planejamento, seleção de skills, delegação, implementação, validação, revisão independente e aprendizado.

## O que a skill controla

- tarefa simples, normal ou complexa;
- Superpowers como metodologia principal;
- OpenSpec para mudanças estruturais;
- UI UX Pro Max para interface e experiência;
- Graphify para repositórios grandes ou mudanças transversais;
- Fable Judge como verificador independente;
- Self-Learning apenas depois da comprovação;
- componentes específicos do ECC, sem entregar autoridade ao pacote inteiro;
- Awesome Design MD como referência para um único `DESIGN.md`;
- Caveman apenas para compactação segura;
- limites e regras de subagentes;
- provas objetivas de conclusão.

## Fluxo automático

```text
PEDIDO
  ↓
Codex Authority Flow
  ↓
classificação: simples | normal | complexa
  ↓
seleção do menor conjunto de skills
  ↓
plano proporcional ao risco
  ↓
implementação e integração
  ↓
testes + lint + typecheck + build + segurança
  ↓
revisão independente quando necessária
  ↓
aprendizado comprovado
  ↓
relatório com evidências
```

## Instalação no Windows PowerShell

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\install.ps1
```

## Instalação no Linux, macOS, WSL ou Git Bash

```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

## Dependências baixadas

Núcleo:

- Superpowers
- OpenSpec Schemas
- UI UX Pro Max
- Graphify
- Self-Learning Skills

Complementos encontrados com `SKILL.md` válido:

- Awesome Design MD
- Fable Method, usando preferencialmente apenas o Judge
- Caveman
- ECC, usando somente componentes especializados

O instalador não inclui GSD, pois ele concorre com Superpowers como metodologia principal.

## Estrutura instalada

```text
~/.agents/skills/codex-authority-flow/
├── SKILL.md
└── references/
    ├── decision-matrix.md
    ├── skill-routing.md
    └── validation-gates.md

~/.codex/AGENTS.md
```

## Uso

Depois de reiniciar o Codex, faça pedidos normalmente:

```text
Implemente autenticação multiempresa com Supabase, papéis, convites, RLS e testes. Siga o fluxo automático do projeto.
```

A skill decide silenciosamente complexidade, plano, skills, subagentes e validações.

## Segurança do instalador

- exige Git;
- preserva `~/.codex/AGENTS.md` existente;
- não executa scripts dos repositórios baixados;
- copia apenas diretórios que contenham `SKILL.md`;
- não armazena tokens ou credenciais.

## Licenças

Cada dependência mantém sua própria licença. Este projeto automatiza o download das fontes oficiais e não incorpora seus conteúdos no repositório.

## Instalação pelo npm e npx

Enquanto o pacote ainda não estiver publicado no registro npm, use diretamente o repositório GitHub:

```bash
npx github:GuilhermeCRibeiro/codex-authority-flow install
```

Instalação global pelo GitHub:

```bash
npm install --global github:GuilhermeCRibeiro/codex-authority-flow
codex-authority-flow install
```

Depois que o pacote for publicado no npm:

```bash
npx codex-authority-flow install
```

ou:

```bash
npm install --global codex-authority-flow
codex-authority-flow install
```

## Instalação pelo Bun

Diretamente do GitHub:

```bash
bunx github:GuilhermeCRibeiro/codex-authority-flow install
```

Instalação global:

```bash
bun add --global github:GuilhermeCRibeiro/codex-authority-flow
codex-authority-flow install
```

Depois da publicação no npm:

```bash
bunx codex-authority-flow install
```

## Instalação pelo Python e comando `py`

No Windows, diretamente do GitHub:

```powershell
py -m pip install "git+https://github.com/GuilhermeCRibeiro/codex-authority-flow.git"
py -m codex_authority_flow install
```

Também é possível usar o executável instalado:

```powershell
codex-authority-flow install
```

No Linux ou macOS:

```bash
python3 -m pip install "git+https://github.com/GuilhermeCRibeiro/codex-authority-flow.git"
python3 -m codex_authority_flow install
```

Depois que o pacote for publicado no PyPI:

```powershell
py -m pip install codex-authority-flow
py -m codex_authority_flow install
```

## Comandos do CLI

Os CLIs Node.js, Bun e Python oferecem os mesmos comandos principais:

```text
install   instala ou atualiza a skill e as dependências
update    executa novamente a instalação e atualiza os repositórios
doctor   verifica Git, arquivos do pacote e instalação local
version   mostra a versão instalada
```

Exemplos:

```bash
npx github:GuilhermeCRibeiro/codex-authority-flow doctor
bunx github:GuilhermeCRibeiro/codex-authority-flow doctor
py -m codex_authority_flow doctor
```

## Publicação nos registros

O repositório já contém os arquivos necessários para publicação:

- `package.json` para npm, npx, Bun e bunx;
- `pyproject.toml` para pip, Python e PyPI;
- `MANIFEST.in` para incluir a skill e os templates no pacote Python;
- `cli/codex-authority-flow.mjs` para o CLI JavaScript;
- `python/codex_authority_flow` para o CLI Python.

A publicação no npm e no PyPI exige contas e tokens próprios nesses serviços. Mesmo antes dessa publicação, todos os comandos acima que apontam para o GitHub já podem funcionar após os arquivos serem enviados ao repositório.
