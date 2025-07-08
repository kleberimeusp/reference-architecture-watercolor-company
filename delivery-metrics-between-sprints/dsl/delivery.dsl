workspace "Gestão de Entregas e Métricas" "C4 completo: Contexto (C1), Containers (C2), Componentes (C3)" {

    !identifiers hierarchical

    model {
        dev = person "Desenvolvedor" "Planeja, implementa tasks, épicos e acompanha sprints."
        po = person "BA / PO" "Analisa métricas, aprova entregas e valida progresso."
        exec = person "Executivo" "Acompanha relatórios estratégicos consolidados."

        system = softwareSystem "Sistema de Métricas e Entregas" "Apoia squads no planejamento, acompanhamento e evolução das entregas. Integrado com GitLab e Big Data." {
            
            dashboard = container "Dashboard Web" "Interface visual para squads e gestão acompanharem métricas e progresso." "React"
            api = container "Backend API" "API REST para consolidar dados de tasks, épicos, sprints e relatórios." "Node.js / Python" {
                component "ModuloTasksEpicos" "Processa dados de stories, issues, PRs vindos do GitLab."
                component "ModuloSprints" "Calcula métricas por sprint: velocity, throughput."
                component "ModuloReleases" "Gerencia entregas por versão (SemVer)."
                component "ModuloRelatorios" "Gera dashboards e relatórios exportáveis."
            }
            etl = container "Pipeline ETL" "Coleta, transforma e consolida dados de GitLab e Big Data." "Python / Spark"
            db = container "Database de Métricas" "Armazena histórico de tasks, sprints, releases, indicadores." "PostgreSQL" {
                tags "Database"
            }
        }

        gitlab = softwareSystem "GitLab" "Repositório de código, issues, PRs, histórico de branches."
        bigdata = softwareSystem "Big Data" "Armazena e consolida métricas históricas, logs e indicadores."

        dev -> system.dashboard "Acompanha sprints e tasks"
        po -> system.dashboard "Analisa métricas e progresso"
        exec -> system.dashboard "Consulta relatórios consolidados"

        system.dashboard -> system.api "Consulta dados e métricas"
        system.api -> system.db "Consulta e armazena dados de métricas"
        system.etl -> system.db "Carga de dados processados"
        system.etl -> gitlab "Coleta tasks, PRs"
        system.etl -> bigdata "Integra dados históricos"
        system.api -> gitlab "Consulta dados em tempo real"
    }

    views {
        systemContext system "C1_Contexto" {
            include *
            autolayout lr
        }

        container system "C2_Containers" {
            include *
            autolayout lr
        }

        component system.api "C3_Componentes_API" {
            include *
            autolayout lr
        }

        
    }
}
