# 🌐 **Documentação C4 completa — Entregas e Métricas**

## 🟢 **Nível 1 — Contexto**

### 🎯 Visão geral

O sistema de gestão de entregas e métricas apoia os squads no planejamento, acompanhamento e evolução das entregas, conectado ao ambiente Big Data, repositórios GitLab e outros sistemas de apoio (Jira, Monitoramento, CI/CD).

---

### 🗺️ Stakeholders e Interações

* **Times de desenvolvimento** → planejam e acompanham tasks, épicos e releases.
* **POs e BAs** → visualizam métricas de valor e andamento.
* **Executivos** → recebem relatórios estratégicos consolidados.
* **Ambiente Big Data** → fornece e recebe dados de métricas históricas.
* **GitLab/GitHub** → fonte de tasks, PRs e histórico de branches.

---

### 💬 Exemplos de integrações

* Webhooks para registrar eventos de merge/push.
* Integração de pipeline de CI/CD para alimentar relatórios.

---

## 🟠 **Nível 2 — Containers**

### 📦 Containers principais

| Container                | Descrição                                                                                             |
| ------------------------ | ----------------------------------------------------------------------------------------------------- |
| **Frontend (Dashboard)** | Interface visual para squads e gestão acompanharem métricas e progresso.                              |
| **Backend API**          | API REST responsável por consolidar dados de tasks, épicos, sprints, integrações GitLab e Big Data.   |
| **Database de Métricas** | Banco de dados para armazenar histórico de tasks, commits, bugs, releases e indicadores de qualidade. |
| **Pipeline ETL**         | Responsável por coletar, transformar e consolidar dados dos repositórios e integrações externas.      |

---

### 🔗 Exemplos de comunicação

* Frontend chama APIs para exibir dashboards (ex: `/api/metrics/sprint`).
* Pipeline ETL carrega dados do GitLab e Big Data → salva no database.
* Backend disponibiliza endpoints de export (JSON, CSV).

---

## 🔵 **Nível 3 — Componentes**

### ⚙️ Backend API

* **Módulo de tasks e épicos**: Processa dados de stories, issues e PRs.
* **Módulo de sprints**: Calcula métricas por sprint (velocity, throughput).
* **Módulo de releases**: Consolida entregas por versão (SemVer).
* **Módulo de relatórios**: Exporta relatórios gerenciais e gráficos.

---

### 💽 Database de Métricas

* **Tabela `tasks`**: status, ciclo de vida, owner, data de entrega.
* **Tabela `epics`**: progresso, dependências.
* **Tabela `releases`**: changelogs, datas.
* **Tabela `sprints`**: velocity, escopo planejado vs entregue.

---

### 🔄 Pipeline ETL

* **Coleta**: issues GitLab, dados Big Data (logs, deploys).
* **Transformação**: normalização, agregação de status, tags.
* **Carga**: alimenta database para consumo do backend.

---

## 🟣 **Nível 4 — Código (Opcional)**

### 💻 Exemplo de classes ou módulos (Node.js / Python)

```plaintext
└─ backend/
   ├─ controllers/
   │    ├─ SprintController.js
   │    ├─ TaskController.js
   │    └─ ReleaseController.js
   ├─ services/
   │    ├─ MetricsService.js
   │    ├─ ETLService.js
   │    └─ GitLabIntegration.js
   ├─ models/
   │    ├─ Task.js
   │    ├─ Epic.js
   │    └─ Sprint.js
   └─ app.js
```

---

### 🧬 Boas práticas no nível de código

* Uso de **domain-driven design** (DDD) para separar regras de negócio.
* Testes unitários e de integração.
* Linters, hooks e pipelines CI/CD (GitLab CI).

---

## 🗺️ **Sugestão de diagramas**

Caso queira gerar diagramas visuais, pode usar **PlantUML com C4-PlantUML**, ou **Structurizr**.

### 📄 PlantUML exemplo (Contexto)

```plantuml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Context.puml

Person(dev, "Desenvolvedor")
Person(ba, "BA / PO")
System(system, "Sistema de Métricas")

dev --> system : Planeja, atualiza, acompanha
ba --> system : Analisa métricas, aprova entregas

System_Ext(gitlab, "GitLab")
System_Ext(bigdata, "Big Data")

system --> gitlab : Busca dados de tasks, PRs
system --> bigdata : Armazena métricas históricas

@enduml
```

---

### 💡 Onde colocar

* Criar arquivos no repositório, por exemplo:

  * `c4-context.puml`
  * `c4-container.puml`
  * `c4-component.puml`
  * `c4-code.puml`
* Adicionar screenshots dos diagramas no wiki.

---

## ✅ **Resumo e próximos passos**

✔️ Você já terá um documento estruturado com os 4 níveis do C4.
✔️ Conectado diretamente ao cenário de squads, métricas e Big Data.
✔️ Alinhado ao repositório `bigdata-info` e ao padrão de versionamento (SemVer) e branches.