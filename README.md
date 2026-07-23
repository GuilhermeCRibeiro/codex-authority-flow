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
