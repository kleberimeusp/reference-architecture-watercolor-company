# 🎮 Cena 01 — Regras Básicas de Entrega de Pull Request (PR) no Sprint

## 🎯 Objetivo

Definir regras mínimas para entrega e aprovação de PRs durante o Sprint, garantindo alinhamento, qualidade técnica e fluidez no fluxo de desenvolvimento.  

---

## ✅ Regra Básica para Entrega de PR no Sprint

| Requisito                          | Descrição                                               |
|-------------------------------------|---------------------------------------------------------|
| **Momento Ideal de Entrega**        | Até 48h antes do encerramento do Sprint                 |
| **Review Obrigatória**              | Pelo menos 1 aprovação de membro do time (não o autor) |
| **CI Automatizado Obrigatório**     | PR só pode ser mergeado se todos os status checks passarem |
| **Descrição Completa do PR**        | Contexto, o que foi feito e instruções de teste         |
| **Checklist de Qualidade no PR**    | Itens validados antes da submissão                      |
| **Commits Limpos e Squash**         | Histórico do PR deve ser consolidado (linear)           |

---

## 📦 Checklist Rápido Antes de Criar o PR

✔️ Código revisado e testado localmente  
✔️ Linter e testes passaram localmente  
✔️ PR com descrição objetiva e clara  
✔️ Vinculado à issue ou card do Sprint (se aplicável)  
✔️ Marcação de reviewers apropriados  
✔️ Commits organizados (squash/rebase antes do merge)  

---

## 🚀 Exemplo de Descrição de PR Recomendada

```markdown
# ✨ Implementa Validação de Dados no Formulário de Cadastro

## 🎯 Objetivo

Adicionar validação de campos obrigatórios no frontend para melhorar a experiência do usuário.  

## 🔧 O que foi feito

- Adicionadas regras de validação no formulário  
- Exibido feedback visual em caso de erro  
- Cobertura de testes atualizada para o novo comportamento  

## ✅ Checklist

- [x] Código segue os padrões de estilo  
- [x] Testes implementados e passando  
- [x] Revisão do código solicitada  
- [x] Documentação atualizada (se necessário)  

## 🔪 Como testar

1. Acessar a tela de cadastro  
2. Tentar submeter o formulário vazio  
3. Verificar se as mensagens de erro aparecem corretamente  
```

---

## 🗓️ Importante sobre o Sprint

✔️ Entregas próximas ao final do Sprint (últimas 48h) devem ser alinhadas com o PO e o time para garantir review e merge sem prejudicar a finalização do ciclo.  

✔️ PRs urgentes fora do fluxo normal devem ser justificados e sinalizados no canal oficial do time.  
