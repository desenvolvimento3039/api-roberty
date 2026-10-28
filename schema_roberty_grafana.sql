-- ==============================================================================
-- SCHEMA DE MONITORAMENTO ROBERTY RPA PARA GRAFANA / POSTGRESQL / MYSQL
-- SICOOB SAO MIGUEL (COOP 3039)
-- ==============================================================================

-- 1. Tabela de Servidores / Runners de Producao
CREATE TABLE IF NOT EXISTS roberty_devices (
    device_id VARCHAR(64) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    online BOOLEAN NOT NULL DEFAULT true,
    platform VARCHAR(50) DEFAULT 'WINDOWS',
    public_ip VARCHAR(50),
    client_version VARCHAR(20),
    total_seconds BIGINT DEFAULT 0,
    success_count INT DEFAULT 0,
    error_count INT DEFAULT 0,
    linked_robots_count INT DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabela de Historico de Execucoes dos Robos (Runs)
CREATE TABLE IF NOT EXISTS roberty_runs (
    run_id VARCHAR(64) PRIMARY KEY,
    robot_id VARCHAR(64) NOT NULL,
    robot_name VARCHAR(255) NOT NULL,
    device_name VARCHAR(100) NOT NULL,
    public_ip VARCHAR(50),
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP,
    duration_seconds INT DEFAULT 0,
    success BOOLEAN NOT NULL,
    trigger_kind VARCHAR(50) DEFAULT 'AUTOMATICO',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_roberty_runs_start_date ON roberty_runs(start_date DESC);
CREATE INDEX IF NOT EXISTS idx_roberty_runs_robot ON roberty_runs(robot_name);
CREATE INDEX IF NOT EXISTS idx_roberty_runs_device ON roberty_runs(device_name);
CREATE INDEX IF NOT EXISTS idx_roberty_runs_status ON roberty_runs(success);

-- 3. Tabela de Agendamentos (Schedules / Cron)
CREATE TABLE IF NOT EXISTS roberty_schedules (
    schedule_id VARCHAR(64) PRIMARY KEY,
    robot_name VARCHAR(255) NOT NULL,
    device_name VARCHAR(100) NOT NULL,
    schedule_mode VARCHAR(50) DEFAULT 'weekly',
    week_days VARCHAR(50),
    time_window VARCHAR(100),
    time_interval VARCHAR(50),
    average_duration_seconds INT DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==============================================================================
-- VIEWS OTIMIZADAS PARA PAINEL GRAFANA
-- ==============================================================================

-- View para Painel de Disponibilidade dos Servidores (Gauge / Stat)
CREATE OR REPLACE VIEW vw_grafana_roberty_servers AS
SELECT 
    name AS runner_name,
    public_ip,
    CASE WHEN online THEN 1 ELSE 0 END AS is_online,
    success_count,
    error_count,
    ROUND((success_count::numeric / NULLIF(success_count + error_count, 0)) * 100, 2) AS success_rate_pct,
    ROUND(total_seconds / 3600.0, 2) AS total_hours_cpu,
    linked_robots_count
FROM roberty_devices;

-- View para Series Temporais de Execucoes por Dia/Hora (Time Series)
CREATE OR REPLACE VIEW vw_grafana_roberty_daily_stats AS
SELECT 
    DATE_TRUNC('day', start_date) AS time_bucket,
    device_name,
    COUNT(*) AS total_runs,
    COUNT(*) FILTER (WHERE success = true) AS success_runs,
    COUNT(*) FILTER (WHERE success = false) AS error_runs,
    ROUND(AVG(duration_seconds), 1) AS avg_duration_sec,
    MAX(duration_seconds) AS max_duration_sec
FROM roberty_runs
GROUP BY DATE_TRUNC('day', start_date), device_name
ORDER BY time_bucket DESC;
