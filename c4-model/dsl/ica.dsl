workspace "ICA Bank - C4 Completo (Contexto, Containers, Componentes)" "Plataforma de serviços financeiros para servidores públicos, com estrutura ágil e foco em benefícios." {

    !identifiers hierarchical

    model {
        
        // Pessoas
        cliente = person "Servidor Público e Comerciante Local" "Usuário final dos produtos e benefícios ICA Bank"
        suporte = person "Suporte Técnico ICA Bank" "Atendimento ao cliente e suporte omnichannel"
        squad = person "Time Ágil ICA Bank" "Desenvolvimento, inovação e manutenção dos produtos"

        // Software System principal
        icaBank = softwareSystem "ICA Bank" "Plataforma financeira integrada com produtos e benefícios" {

            icaPay = container "ICA PAY" "Plataforma de pagamentos e cashback" "Web, Mobile, APIs" {
                apiPagamentos = component "API de Pagamentos" "Expõe operações de pagamento e cashback" "REST"
                processamento = component "Módulo de Processamento" "Executa transações financeiras" "Java Service"
                gatewayExterno = component "Integração com Gateway" "Conecta com processadoras externas" "HTTP/SOAP"

                apiPagamentos -> processamento "Invoca processamento"
                processamento -> gatewayExterno "Envia transações"
            }

            icaInvest = container "ICA INVEST" "Investimentos P2P em MPEs" "Web, APIs" {
                apiInvest = component "API de Investimentos" "Opera aplicações e resgates" "REST"
                motorCredito = component "Motor de Análise" "Analisa elegibilidade de empresas" "Java Service"
                integracaoParceiros = component "Integração Parceiros" "Integra com portais externos" "REST/HTTP"

                apiInvest -> motorCredito "Consulta elegibilidade"
                motorCredito -> integracaoParceiros "Valida dados externos"
            }

            icaCred = container "ICA CRED" "Crédito rápido e descomplicado" "Web, APIs" {
                apiCred = component "API de Crédito" "Simulação e contratação de crédito" "REST"
                analiseRisco = component "Análise de Risco" "Avaliação automatizada de perfil" "Microservice"
                antifraude = component "Módulo Antifraude" "Previne tentativas de fraude" "HTTP API"

                apiCred -> analiseRisco "Envia dados para análise"
                analiseRisco -> antifraude "Valida segurança"
            }

            icaCard = container "ICA CARD" "Cartão de crédito com benefícios" "Web, APIs" {
                apiCartao = component "API do Cartão" "Gerencia cartões e limites" "REST"
                emissor = component "Emissor de Cartão" "Plataforma de emissão" "SOAP"
                parceirosDesconto = component "Integração de Benefícios" "Conecta programas de desconto" "HTTP"

                apiCartao -> emissor "Solicita emissão"
                apiCartao -> parceirosDesconto "Oferece benefícios"
            }

            beneficios = container "ICA Benefícios Adicionais" "Saúde, Telemedicina, Seguro, WinCupom, Auxílio Pet" "Web, APIs" {
                apiBeneficios = component "API de Benefícios" "Gerencia serviços de saúde e adicionais" "REST"
                telemedicina = component "Módulo Telemedicina" "Atendimentos virtuais" "WebRTC/HTTP"
                parceirosSaude = component "Integração Saúde" "Conecta redes credenciadas" "HTTP"

                apiBeneficios -> telemedicina "Ativa atendimento"
                apiBeneficios -> parceirosSaude "Valida rede de serviços"
            }
        }

        // Relacionamentos de alto nível
        cliente -> icaBank.icaPay "Utiliza pagamentos e cashback"
        cliente -> icaBank.icaInvest "Investe em MPEs"
        cliente -> icaBank.icaCred "Solicita crédito pessoal"
        cliente -> icaBank.icaCard "Utiliza o cartão com benefícios"
        cliente -> icaBank.beneficios "Acessa benefícios complementares"

        suporte -> icaBank "Oferece suporte técnico"
        squad -> icaBank "Desenvolve e mantém o ecossistema"

        // Nota visual sobre expansão
        notaExpansao = element "Cidades Atendidas e Meta" "ICA Bank presente em:\n- Barra Mansa/RJ\n- Feira de Santana/BA\n- Gurupi/TO\n- Aurora do Pará/PA\n\nMeta: atingir 10% dos municípios (~550 cidades)." {
            tags "Nota"
        }
    }

    views {

        // C1 - Contexto
        systemContext icaBank "contexto" {
            title "C1 - Contexto ICA Bank"
            include *
            include notaExpansao
            autolayout lr
        }

        // C2 - Containers
        container icaBank "containers" {
            title "C2 - Containers ICA Bank"
            include *
            autolayout lr
        }

        // C3 - ICA PAY
        component icaBank.icaPay "componentes_icapay" {
            title "C3 - Componentes ICA PAY"
            include *
            autolayout lr
        }

        // C3 - ICA INVEST
        component icaBank.icaInvest "componentes_icainvest" {
            title "C3 - Componentes ICA INVEST"
            include *
            autolayout lr
        }

        // C3 - ICA CRED
        component icaBank.icaCred "componentes_icacred" {
            title "C3 - Componentes ICA CRED"
            include *
            autolayout lr
        }

        // C3 - ICA CARD
        component icaBank.icaCard "componentes_icacard" {
            title "C3 - Componentes ICA CARD"
            include *
            autolayout lr
        }

        // C3 - Benefícios Adicionais
        component icaBank.beneficios "componentes_beneficios" {
            title "C3 - Componentes Benefícios Adicionais"
            include *
            autolayout lr
        }

        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Person" {
                background #08427b
                color #ffffff
                shape person
            }
            element "Nota" {
                shape roundedbox
                background #fff2b2
                color #000000
            }
            element "Component" {
                background #85bb65
                color #000000
            }
        }
    }
}
