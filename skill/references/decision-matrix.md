# Matriz de decisão

| Situação | Skills | Agentes | Validação mínima |
|---|---|---:|---|
| Texto, formatação, ajuste local | Authority Flow | 0 | teste focado + diff |
| CRUD, componente, endpoint | Authority Flow + Superpowers | 0–2 | testes + lint + typecheck/build |
| Tela ou dashboard | anteriores + UI UX Pro Max | 0–2 | responsividade + acessibilidade + build |
| Mudança de contrato ou banco | Authority Flow + OpenSpec + Superpowers | 1–3 | migrações + testes + build |
| Auth, RLS ou segurança | anteriores + revisão especializada | 1–4 | testes negativos + políticas + secrets scan |
| Monorepo desconhecido | Authority Flow + Graphify + Superpowers | 1–4 | mapa de impacto + testes integrados |
| Final de tarefa complexa | Fable Judge opcional | 1 revisor | evidências independentes |

## Regras anticolisão

- Não usar Superpowers, GSD e Fable Method completo juntos.
- Não carregar ECC inteiro globalmente; selecionar apenas módulos úteis.
- Não executar Graphify em mudanças pequenas.
- Não criar OpenSpec para correções localizadas.
- Não registrar aprendizado antes da validação.
