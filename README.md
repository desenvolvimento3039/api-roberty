# Painel de Monitoramento Corporativo Roberty RPA
**Sicoob Sao Miguel (Coop 3039)**

Repositorio oficial: [https://github.com/desenvolvimento3039/api-roberty.git](https://github.com/desenvolvimento3039/api-roberty.git)

---

## 1. Visao Geral da Solucao

Sistema corporativo de observabilidade e telemetria para **100% dos robos da plataforma Roberty Automation**, conectando-se diretamente a **API Cloud v4 (`https://api.roberty.app/v4`)** da cooperativa.

O sistema monitora os 3 servidores de producao (*Unattended Production Runners*), desvinculando o monitoramento das maquinas locais de desenvolvimento:
- **Roberty40(PRD)** (`IP: 177.129.79.254`) - 13.675 sucessos / 472 erros
- **Roberty20(PRD)** (`IP: 177.129.79.254`) - 4.661 sucessos / 784 erros
- **Roberty(UAD01)** (`IP: 187.33.160.238`) - 989 sucessos / 138 erros

---

## 2. Estrutura do Repositorio

```
.
├── PAINEL_MONITORAMENTO_ROBERTY.html  # Dashboard interativo SPA (100% autocontido)
├── roberty_collector.js              # Coletor de telemetria, servidor web e exporter
├── roberty_data.json                 # Base consolidada de metricas em JSON
├── grafana_dashboard_roberty.json    # Template pronto para importacao no Grafana
├── schema_roberty_grafana.sql        # DDL de tabelas e views para PostgreSQL/MySQL
├── dados_roberty_grafana.sql         # Script SQL com 976 linhas de dados historicos
├── export_to_sql.js                  # Script gerador/atualizador da base SQL
├── Dockerfile                        # Containerizacao da aplicacao
├── docker-compose.yml                # Orquestracao Docker Compose (1 comando)
├── package.json                      # Metadados e scripts de execucao npm
├── iniciar_painel.bat                # Launcher de 1-clique para Windows
└── README.md                         # Este manual operacional
```

---

## 3. Comandos para Instanciar e Rodar

### Opcao 1: Instanciar com Docker / Docker Compose (Recomendado para Servidores / Maquina 194)

1. Clone o repositorio no servidor:
   ```bash
   git clone https://github.com/desenvolvimento3039/api-roberty.git
   cd api-roberty
   ```

2. Suba o container com Docker Compose:
   ```bash
   docker compose up -d --build
   ```

3. Verifique o status e os logs:
   ```bash
   docker compose ps
   docker compose logs -f
   ```

4. Acesse no navegador:
   - Dashboard Web: `http://<IP_DO_SERVIDOR>:8080/`
   - Metricas Prometheus: `http://<IP_DO_SERVIDOR>:8080/metrics`
   - API de Execucoes: `http://<IP_DO_SERVIDOR>:8080/api/runs`
   - API de Servidores: `http://<IP_DO_SERVIDOR>:8080/api/devices`

---

### Opcao 2: Instanciar com Node.js Nativo (Linux ou Windows)

1. Clone o repositorio:
   ```bash
   git clone https://github.com/desenvolvimento3039/api-roberty.git
   cd api-roberty
   ```

2. Execute o coletor e servidor HTTP:
   ```bash
   node roberty_collector.js --serve --port 8080
   ```
   *(Caso utilize o Node.js embutido do Roberty no Windows, utilize o comando:)*
   ```powershell
   & "C:\Users\jefferson.miguel\AppData\Roaming\roberty-studio-v4\vendor\node\24.22.1\node.exe" roberty_collector.js --serve --port 8080
   ```

3. Em segundo plano via PM2 (se disponivel no servidor Linux/Windows):
   ```bash
   pm2 start roberty_collector.js --name "roberty-monitor" -- --serve --port 8080
   pm2 save
   ```

---

### Opcao 3: Execucao Rapida no Windows (Sem Servidor HTTP)

Basta dar um duplo clique no arquivo:
`iniciar_painel.bat`
Ele sincroniza a telemetria via API da Roberty e abre o arquivo `PAINEL_MONITORAMENTO_ROBERTY.html` diretamente no seu navegador padrão.

---

## 4. Como Integrar ao Grafana (Maquina 194)

### Metodo A: Via Metricas Prometheus (Scrape HTTP) `[MAIS RAPIDO]`

1. O coletor expoe automaticamente o formato padrao OpenMetrics em:
   `http://<IP_ONDE_RODA_O_COLETOR>:8080/metrics`

2. No arquivo `prometheus.yml` da maquina 194, adicione o job de coleta:
   ```yaml
   scrape_configs:
     - job_name: 'roberty_rpa'
       scrape_interval: 30s
       static_configs:
         - targets: ['<IP_ONDE_RODA_O_COLETOR>:8080']
   ```

3. Recarregue as configuracoes do Prometheus:
   ```bash
   curl -X POST http://localhost:9090/-/reload
   ```

4. No Grafana da maquina 194:
   - Acesse **Dashboards > New > Import**.
   - Faca o upload do arquivo `grafana_dashboard_roberty.json`.
   - Selecione o Data Source Prometheus e confirme.

---

### Metodo B: Via Plugin Grafana Infinity (REST API Direta)

Caso nao utilize Prometheus na maquina 194:

1. Instale o plugin Infinity no Grafana da 194:
   ```bash
   grafana-cli plugins install yesoreyeram-infinity-datasource
   ```
   Reinicie o Grafana:
   ```bash
   systemctl restart grafana-server  # Linux
   # ou via Docker: docker restart grafana
   ```

2. Adicione o Data Source do tipo **Infinity** apontando para o servidor:
   - Endpoint de Execucoes: `http://<IP_DO_COLETOR>:8080/api/runs`
   - Endpoint de Servidores: `http://<IP_DO_COLETOR>:8080/api/devices`
   - Endpoint de Agendamentos: `http://<IP_DO_COLETOR>:8080/api/schedules`

---

### Metodo C: Via Banco de Dados Relacional (PostgreSQL / MySQL)

1. Crie as tabelas e views no banco da 194:
   ```bash
   psql -h localhost -U postgres -d seu_banco -f schema_roberty_grafana.sql
   ```

2. Popule os dados historicos:
   ```bash
   psql -h localhost -U postgres -d seu_banco -f dados_roberty_grafana.sql
   ```

3. Atualizacao periodica via agendamento (Task Scheduler / Cron):
   ```bash
   node export_to_sql.js
   ```

---

## 5. Endpoints Disponiveis no Coletor

| Metodo | Endpoint | Descricao |
| :--- | :--- | :--- |
| `GET` | `/` | Dashboard Web HTML Interativo SPA |
| `GET` | `/metrics` | Metricas padrao Prometheus para observabilidade |
| `GET` | `/api/runs` | Array JSON com todas as execucoes detalhadas |
| `GET` | `/api/devices` | Lista de servidores, IPs, status online e metricas |
| `GET` | `/api/schedules` | Cronogramas e agendamentos de todos os robos |
| `GET` | `/api/data` | Payload completo consolidado em JSON |
| `GET` | `/api/refresh` | Forca sincronizacao imediata contra a API Cloud |


---

## 8. Painel Dinamico em React (Branch `feature/react-dashboard`)

Uma versao moderna desenvolvida com **React 19 + Vite + Lucide Icons** foi criada na branch `feature/react-dashboard`:
- **Auto-Refresh dinamico configuravel** (Off, 15s, 30s, 60s)
- **Cronometro em tempo real** calculando duracao ao vivo dos robos executando agora
- **Filtros reativos instantaneos** (sem recarregar a pagina)
- **Paginacao fluida** com seletor de pagina
- **Exportacao CSV** com 1 clique

### Como Rodar o Painel React Localmente

#### Metodo 1: 1-Clique no Windows (Recomendado)
Execute o arquivo:
`iniciar_react.bat`
Ele permitira escolher entre o modo producao unificado ou o modo desenvolvimento React com Vite Hot-Reload.

#### Metodo 2: Modo Producao Unificado (Porta 8080)
```powershell
node roberty_collector.js --serve --port 8080
```
Acesse: `http://localhost:8080`

#### Metodo 3: Modo Desenvolvimento React com Hot Module Replacement (Porta 3000)
1. Terminal 1 (Backend de telemetria):
   ```powershell
   node roberty_collector.js --serve --port 8080
   ```
2. Terminal 2 (Vite Frontend):
   ```powershell
   cd frontend
   npm run dev
   ```
Acesse: `http://localhost:3000`
