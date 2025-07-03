# 🎬 **Cena 01 — Setup Básico GitHub Rules + GitHub Actions**

## 🎯 Objetivo

Estruturar um repositório com regras mínimas de segurança e automação CI usando **Branch Protection Rules** e **GitHub Actions**, garantindo qualidade e fluxo colaborativo desde o primeiro commit.

---

## 🛡️ **GitHub Branch Protection - Regras Básicas**

Crie as seguintes regras no GitHub via **Settings > Branches**:

| Regra                                | Valor Sugerido     | Descrição                                                      |
| ------------------------------------ | ------------------ | -------------------------------------------------------------- |
| Branch Protegida                     | `main`             | Apenas PRs aprovados podem alterar a branch main               |
| Require Pull Request Reviews         | Ativado (1 review) | Exige ao menos uma aprovação por PR                            |
| Require Status Checks to Pass        | Ativado            | Bloqueia merge se ações automatizadas falharem                 |
| Require Linear History               | Ativado            | Impede merges com histórico divergente (somente squash/rebase) |
| Dismiss stale pull request approvals | Ativado            | Aprovações são descartadas se houver novos commits no PR       |

Opcional:

* Exigir assinatura de commits (`Signed commits`)
* Restringir quem pode aprovar (`Restrict who can push`)

---

## ⚙️ **GitHub Actions - Exemplo Básico**

Crie o arquivo `.github/workflows/ci.yml` com o pipeline inicial:

```yaml
name: CI Básico

on:
  pull_request:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout do Código
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: "18"

      - name: Instalar Dependências
        run: npm ci

      - name: Rodar Testes
        run: npm test
```

Esse fluxo:

✔️ Executa em todos os Pull Requests contra a branch `main`
✔️ Garante que os testes precisam passar antes do merge
✔️ Se conecta às Branch Protection Rules como "Status Check" obrigatório

---

## 📂 **Estrutura Inicial do Projeto**

```
meu-projeto/
├── .github/
│   └── workflows/
│       └── ci.yml
├── src/
├── package.json
├── README.md
```

---

## 📝 **README Exemplo com Passos**

````markdown
# 🚀 Meu Projeto Exemplo

Projeto inicial com GitHub Actions e Proteção de Branches.

## 📦 Pré-Requisitos

- Node.js 18+
- Conta no GitHub com permissões de admin no repositório

## 🛠️ Setup Local

```bash
git clone git@github.com:minha-org/meu-projeto.git
cd meu-projeto
npm install
````

## 🚧 Fluxo de Contribuição

1. Crie uma branch a partir de `main`
2. Faça suas alterações
3. Abra um Pull Request
4. O GitHub Actions executará testes automaticamente
5. Um revisor deve aprovar o PR
6. Após aprovação e testes passando, o merge pode ser feito

## ✅ Regras Ativas

* Branch `main` protegida
* PRs exigem aprovação de outro membro
* Testes precisam passar no CI antes do merge
* Histórico linear obrigatório

```

