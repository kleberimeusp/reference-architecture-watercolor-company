# 🔐 **1. Configurar Secrets e Tokens no GitHub**

Os **Secrets** armazenam credenciais seguras que podem ser usadas nas Actions.

### 📥 Onde Configurar:

`Settings > Secrets and Variables > Actions`

### 🔑 Exemplos de Secrets Comuns:

| Nome do Secret       | Finalidade                         |
| -------------------- | ---------------------------------- |
| `NODE_AUTH_TOKEN`    | Publicação de pacotes NPM privados |
| `GH_TOKEN`           | Autenticações em APIs do GitHub    |
| `DEPLOY_SSH_KEY`     | Chave privada para deploy via SSH  |
| `DOCKERHUB_USERNAME` | Usuário para push de imagens       |
| `DOCKERHUB_TOKEN`    | Token para autenticação DockerHub  |

**Exemplo de uso no workflow:**

```yaml
- name: Publicar Pacote NPM
  run: npm publish
  env:
    NODE_AUTH_TOKEN: ${{ secrets.NODE_AUTH_TOKEN }}
```

**Importante:** Nunca coloque senhas ou tokens diretamente no código ou YAML!

---

# 🧩 **2. Adicionar Fluxos Extras no GitHub Actions (Lint, Build, Deploy)**

### ✔️ Exemplo de Pipeline Completo:

```yaml
name: CI Completo

on:
  pull_request:
    branches: [ "main" ]

jobs:
  lint-build-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "18"

      - name: Instalar Dependências
        run: npm ci

      - name: Rodar Linter
        run: npm run lint

      - name: Build do Projeto
        run: npm run build

      - name: Rodar Testes
        run: npm test

  deploy:
    needs: lint-build-test
    if: github.ref == 'refs/heads/main' && github.event_name == 'push'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "18"

      - name: Build para Produção
        run: npm run build

      - name: Deploy via SSH
        run: ssh -i ${{ secrets.DEPLOY_SSH_KEY }} user@server "cd /app && git pull && npm ci && npm run start"
```

Esse fluxo:

✅ Executa lint, build e testes em todos os PRs
✅ Faz deploy automático ao push na branch `main` (pode ser controlado via tag, se preferir)

---

# 🛡️ **3. Aplicar Regras de Segurança e Templates de PR**

### 🔒 Regras Recomendadas:

* **Exigir aprovação de PRs**
* **Bloquear pushes diretos na branch protegida**
* **Exigir assinaturas de commits**
* **Rejeitar force push**
* **Revisão obrigatória por time específico (opcional)**

Tudo configurável em `Settings > Branches > Branch Protection Rules`

---

### 📝 Exemplo de Template de Pull Request (`.github/pull_request_template.md`):

```markdown
# 🚀 Descrição do PR

Descreva brevemente o que foi implementado ou corrigido.

# ✅ Checklist

- [ ] Código segue padrões de estilo
- [ ] Linter passou sem erros
- [ ] Testes implementados e passando
- [ ] Documentação atualizada (se aplicável)

# 🔧 Áreas Impactadas

Liste módulos ou funcionalidades afetadas.

# 🧪 Como Testar

Passos para validar as mudanças manualmente.
```

---

# ⚡ Resumo das Boas Práticas

✔️ Proteção rigorosa nas branches principais
✔️ CI automatizado com lint, build, testes e deploy controlado
✔️ Secrets seguros e nunca expostos no código
✔️ Templates que organizam a colaboração via PR