# Skill Routing

## Regra principal

Ative somente o menor conjunto que entregue e prove o resultado.

| Situação | Skills recomendadas | Evitar |
|---|---|---|
| Ajuste localizado | Authority Flow | OpenSpec, Graphify, subagentes |
| CRUD/API comum | Authority Flow + Superpowers | Segunda metodologia |
| Tela ou dashboard | Authority Flow + Superpowers + UI UX Pro Max | Múltiplos estilos |
| Mudança de contrato | Authority Flow + Superpowers + OpenSpec | Execução sem especificação |
| Supabase/RLS | Authority Flow + Superpowers + OpenSpec + revisão de segurança | Alterar banco sem migração |
| Repositório grande | Authority Flow + Graphify + Superpowers | Graphify em tarefa trivial |
| Debugging difícil | Authority Flow + debugging sistemático + Graphify se transversal | Tentativas aleatórias |
| Alto risco | Fluxo aplicável + Fable Judge | Autorrevisão como única prova |
| Aprendizado | Self-Learning após validação | Aprender hipóteses |

## Exclusões

- Superpowers e GSD não devem conduzir a mesma tarefa.
- Superpowers e Fable Method completo não devem conduzir a mesma tarefa.
- ECC completo não deve assumir autoridade global.
- Awesome Design MD não substitui o `DESIGN.md` do projeto.
