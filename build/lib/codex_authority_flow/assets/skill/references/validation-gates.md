# Validation Gates

## Gate 1 — Escopo

- Requisitos compreendidos.
- Fora de escopo identificado.
- Arquivos alterados justificáveis.

## Gate 2 — Correção

- Comportamento esperado implementado.
- Casos de erro tratados.
- Testes relevantes adicionados ou atualizados.

## Gate 3 — Qualidade

- Lint e typecheck passam quando disponíveis.
- Build passa quando aplicável.
- Diff não contém mudanças acidentais.

## Gate 4 — Segurança

Obrigatório em autenticação, autorização, banco, APIs e dados sensíveis:

- menor privilégio;
- validação de entrada;
- segredos fora do cliente e do repositório;
- testes negativos;
- RLS e políticas verificadas separadamente.

## Gate 5 — Integração

- Camadas integradas de ponta a ponta.
- Migrações reproduzíveis.
- Compatibilidade e regressões avaliadas.

## Gate 6 — Aprovação

A tarefa só pode ser declarada concluída quando:

- evidências estão disponíveis;
- falhas conhecidas estão resolvidas ou explicitamente relatadas;
- riscos restantes estão documentados;
- revisão independente foi feita quando exigida.
