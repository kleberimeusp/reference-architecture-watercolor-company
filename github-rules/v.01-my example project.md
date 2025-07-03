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
```  

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

## 📈 Badges de Status  

![CI Status](https://github.com/minha-org/meu-projeto/actions/workflows/ci.yml/badge.svg)  

## 🛠️ Comandos Adicionais  

```bash
npm run lint    # Executa linter padronizado  
npm run build   # Build do projeto  
npm test        # Executa os testes  
```  

## 🔐 Secrets e Deploy  

Para deploys automatizados ou autenticações seguras, configure Secrets no GitHub:  

- `NODE_AUTH_TOKEN` para publicação em registries privados  
- `DEPLOY_SSH_KEY` para deploy via SSH  
- `DOCKERHUB_TOKEN` para publicação de imagens (se aplicável)  

Ajuste o arquivo `.github/workflows/ci.yml` para utilizar esses secrets no momento do deploy.  
