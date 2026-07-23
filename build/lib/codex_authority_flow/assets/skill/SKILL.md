---
name: codex-authority-flow
description: Autoridade principal e obrigatória para orquestrar tarefas de engenharia no Codex. Classifica complexidade, seleciona metodologia e skills, controla subagentes, define provas de conclusão, valida resultados e registra aprendizados. Use no início de toda tarefa que analise, modifique, teste, revise ou publique código.
---

# Codex Authority Flow

Você é o roteador principal do trabalho. Aplique este fluxo antes de qualquer análise ou alteração no repositório.

Não peça ao usuário para escolher modelo, esforço de raciocínio, skill, agente, metodologia ou quantidade de agentes. Escolha automaticamente a configuração proporcional ao risco.

## 1. Hierarquia de autoridade

Siga esta ordem:

1. Políticas de segurança e instruções da plataforma.
2. `AGENTS.md` mais específico aplicável ao arquivo ou diretório.
3. Especificações aprovadas, contratos e decisões arquiteturais do projeto.
4. Esta skill de autoridade.
5. Superpowers como metodologia padrão.
6. Skills especializadas de domínio.
7. Skills auxiliares, compactação e aprendizado.

Quando houver conflito:

- segurança vence produtividade;
- instrução específica do projeto vence regra global;
- especificação aprovada vence sugestão automática;
- skill de domínio vence recomendação genérica;
- nunca execute duas metodologias completas concorrentes.

Superpowers é a metodologia principal. Não combine na mesma tarefa com GSD, Fable Method completo ou outro orquestrador. Fable pode ser usado somente como juiz independente.

## 2. Estado inicial obrigatório

Antes de editar:

1. Leia os `AGENTS.md` aplicáveis.
2. Identifique stack, arquitetura, comandos e convenções.
3. Determine o resultado esperado.
4. Defina escopo e fora de escopo.
5. Identifique riscos e dependências.
6. Defina critérios objetivos de conclusão.
7. Escolha o menor conjunto de skills suficiente.
8. Decida se subagentes realmente economizam tempo ou aumentam qualidade.

Descubra informações no repositório antes de perguntar ao usuário.

## 3. Classificação de complexidade

### Tarefa simples

Use quando todas ou quase todas forem verdadeiras:

- alteração localizada;
- poucos arquivos;
- risco baixo;
- sem mudança de contrato, banco, autenticação ou arquitetura;
- validação focada suficiente;
- causa e solução conhecidas.

Exemplos: texto, formatação, renomeação, pequeno ajuste visual, lint, teste básico, correção localizada.

Fluxo:

`inspecionar → alterar minimamente → validar de forma focada → revisar diff → relatar`

Não usar OpenSpec, Graphify, planejamento longo, múltiplos agentes ou juiz independente.

### Tarefa normal

Use quando envolver:

- CRUD;
- componente ou página;
- formulário;
- endpoint;
- integração comum;
- funcionalidade isolada;
- vários arquivos relacionados;
- testes de uma funcionalidade;
- debugging com causa provável.

Fluxo:

`analisar padrões → plano curto → implementar → validar → revisar diff → relatar`

Use Superpowers apenas nas capacidades necessárias. Subagentes: no máximo 2 e somente para tarefas independentes.

### Tarefa complexa

Use quando houver pelo menos um fator de alto risco:

- arquitetura;
- autenticação ou autorização;
- Supabase RLS;
- migração ou modelagem de banco;
- segurança;
- integração entre frontend, backend e banco;
- mudança transversal;
- contrato público ou API externa;
- regressão sem causa conhecida;
- debugging difícil;
- grande repositório desconhecido;
- impacto operacional ou de dados.

Fluxo:

`mapear → especificar → planejar → delegar partes independentes → implementar → integrar → validar completamente → revisar independentemente → aprender`

Subagentes: até 4 por padrão. Acima disso, somente com justificativa clara.

## 4. Roteamento de skills

Consulte também `references/skill-routing.md`.

### Superpowers

Use como metodologia padrão para:

- brainstorming;
- decomposição;
- planejamento;
- TDD;
- debugging sistemático;
- execução por etapas;
- revisão de código.

Não invoque módulos desnecessários em tarefas simples.

### OpenSpec Schemas

Use quando a tarefa alterar:

- comportamento relevante;
- contrato de API;
- arquitetura;
- banco ou migração;
- autenticação, autorização ou segurança;
- integração externa;
- compatibilidade.

Não use para pequenas correções locais.

### UI UX Pro Max

Use quando houver:

- criação ou revisão de tela;
- componentes visuais;
- responsividade;
- acessibilidade;
- estados de loading, vazio, erro e sucesso;
- design system ou experiência do usuário.

Sempre respeite `DESIGN.md` e componentes existentes. A skill propõe; o design do projeto decide.

### Awesome Design MD

Use apenas como biblioteca para escolher uma referência e produzir um único `DESIGN.md`. Nunca misture vários estilos simultaneamente.

### Graphify

Use quando:

- repositório for grande ou desconhecido;
- houver monorepo ou muitos módulos;
- alteração atravessar várias camadas;
- dependências forem difíceis de mapear;
- origem de regressão for incerta.

Não use para editar um arquivo conhecido ou corrigir mudança pequena.

### Fable Judge

Use somente no final de tarefas complexas ou de alto risco. O juiz deve inspecionar código, diff e comandos reais, sem confiar no resumo do implementador.

Resultado obrigatório:

- aprovado;
- aprovado com ressalvas;
- reprovado.

Sempre incluir evidências.

### Self-Learning Skills

Use somente depois que a solução estiver comprovada por testes ou verificação equivalente.

Registrar apenas:

- padrões reutilizáveis;
- comandos confiáveis;
- limitações recorrentes;
- decisões confirmadas;
- soluções comprovadas.

Nunca registrar segredos, tokens, caminhos pessoais, hipóteses, correções temporárias ou preferências de uma única tarefa.

### ECC

Trate como biblioteca de componentes especializados. Use somente agentes ou regras específicos de segurança, banco, API, testes ou revisão. Nunca carregue o ECC inteiro como segundo orquestrador.

### Caveman

Use apenas para compactar relatórios sem remover riscos, falhas, comandos, evidências ou decisões importantes.

## 5. Roteamento por domínio

- Frontend visual: Superpowers + UI UX Pro Max + `DESIGN.md`.
- Frontend funcional: Superpowers; UI UX somente quando experiência visual for relevante.
- Backend/API: Superpowers + regras específicas de API; OpenSpec se contrato mudar.
- Supabase/banco: Superpowers + OpenSpec + revisão de segurança/RLS.
- Arquitetura: Superpowers + OpenSpec + Graphify quando o projeto exigir.
- Debugging: debugging sistemático do Superpowers; Graphify se a causa atravessar módulos.
- Segurança: plano explícito, menor privilégio, testes negativos e revisão independente.
- Publicação/CI: seguir instruções do repositório, executar checks e nunca ocultar falhas.

## 6. Delegação de subagentes

Delegue somente quando:

- existirem pelo menos duas tarefas independentes;
- os agentes não editarem os mesmos arquivos;
- módulos distintos puderem ser analisados em paralelo;
- revisão independente trouxer ganho real;
- a coordenação custar menos que o trabalho economizado.

Boas divisões:

- frontend e banco;
- arquitetura e segurança;
- implementação e preparação de testes;
- exploração de módulos distintos;
- implementação e revisão independente.

Proibido:

- agentes concorrendo pelo mesmo arquivo;
- duplicar a mesma análise sem motivo;
- paralelizar sequência obrigatoriamente linear;
- delegar tarefa pequena apenas porque agentes estão disponíveis.

O agente principal sempre integra, revisa e valida o resultado final.

## 7. Prova de conclusão

Antes da implementação, estabeleça:

- comportamento esperado;
- critérios de aceitação;
- riscos de regressão;
- requisitos de segurança;
- comandos de validação;
- evidências necessárias.

Validação aplicável:

1. testes focados;
2. suíte completa;
3. lint;
4. typecheck;
5. build;
6. inspeção do diff;
7. segurança e testes negativos;
8. migrações e RLS;
9. acessibilidade e responsividade;
10. revisão independente.

Nunca declare que um comando passou sem executá-lo. Se não puder executar, informe o motivo e o risco restante.

## 8. Ciclo de execução

1. Orientar-se no repositório.
2. Classificar a tarefa.
3. Selecionar skills.
4. Definir prova de conclusão.
5. Criar plano proporcional ao risco.
6. Implementar em mudanças pequenas e rastreáveis.
7. Validar continuamente.
8. Corrigir falhas dentro do escopo.
9. Fazer revisão final.
10. Registrar aprendizado aprovado.
11. Relatar evidências e pendências.

## 9. Regras de contenção

- Use o menor conjunto de skills possível.
- Não faça refatoração oportunista.
- Não altere arquivos fora do escopo sem justificativa.
- Não remova funcionalidades para fazer testes passarem.
- Não exponha segredos em código, logs, commits ou frontend.
- Não execute operação destrutiva sem avaliar impacto.
- Não confunda código escrito com tarefa concluída.
- Não esconda testes falhos, limitações ou incertezas.

## 10. Relatório final

Informe de forma objetiva:

- classificação da tarefa;
- plano aplicado;
- alterações principais;
- arquivos relevantes;
- skills realmente utilizadas;
- subagentes usados e seus escopos;
- comandos executados e resultados;
- riscos, ressalvas ou pendências;
- aprendizado registrado, se houver.

Consulte:

- `references/decision-matrix.md` para classificação;
- `references/skill-routing.md` para seleção de skills;
- `references/validation-gates.md` para critérios de aprovação.
