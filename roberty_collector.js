/**
 * ==============================================================================
 * SISTEMA DE MONITORAMENTO CORPORATIVO ROBERTY AUTOMATION (RPA)
 * SICOOB SAO MIGUEL - COOP 3039
 * ==============================================================================
 * Coletor de Telemetria, Orquestracao, Servidor Web (React SPA) e Grafana
 * ==============================================================================
 */

const https = require('https');
const http = require('http');
const fs = require('fs');
const path = require('path');

// Configuracao Padrao e Credenciais
const DEFAULT_CONFIG = {
    apiUrl: 'https://api.roberty.app/v4',
    workspaceId: '69665770092003387a6e99f2', // Sicoob Sao Miguel
    apiKey: 'dedf1907a192d4fb35a662f87087f33c99f8bc1cc4a95cd11c77cf7edb0e167e',
    userToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJraW5kIjoiVXNlciIsInRhcmdldCI6IjY5YTcyODAyZWYyYTI5ZmVjNGJhMTg4YSIsImlhdCI6MTc5MTQ3ODc3Ny44NTgsImV4cCI6MTc5NDA3MDc3Ny44NTh9.td8R-KodC2CFR6ypVWro4Y0YF9_vkHF0CKPFo9vjeX4',
    httpPort: 8080,
    pollIntervalSeconds: 300
};

function getLocalStudioToken() {
    try {
        const appData = process.env.APPDATA || '';
        const configPath = path.join(appData, 'roberty-studio-v4', 'config.json');
        if (fs.existsSync(configPath)) {
            const cfg = JSON.parse(fs.readFileSync(configPath, 'utf8'));
            if (cfg?.Authentication?.token) {
                return cfg.Authentication.token;
            }
        }
    } catch (e) {
        // Fallback
    }
    return DEFAULT_CONFIG.userToken;
}

const activeToken = getLocalStudioToken();

function apiGet(urlPath) {
    return new Promise((resolve, reject) => {
        const req = https.request({
            hostname: 'api.roberty.app',
            path: urlPath,
            method: 'GET',
            headers: {
                'Cookie': `userToken=${activeToken}`,
                'x-api-key': DEFAULT_CONFIG.apiKey,
                'User-Agent': 'RobertyMonitorDashboard/1.0 (Sicoob Sao Miguel 3039)'
            },
            timeout: 15000
        }, res => {
            let data = '';
            res.on('data', chunk => data += chunk);
            res.on('end', () => {
                try {
                    resolve({ status: res.statusCode, data: JSON.parse(data) });
                } catch (e) {
                    resolve({ status: res.statusCode, raw: data });
                }
            });
        });
        req.on('error', err => reject(err));
        req.on('timeout', () => {
            req.destroy();
            reject(new Error('[TIMEOUT] Requisicao excedeu 15 segundos'));
        });
        req.end();
    });
}

// Coleta exaustiva de telemetria
async function collectMonitoringData() {
    console.log('[INFO] Iniciando coleta de telemetria da plataforma Roberty...');
    const startTime = Date.now();

    // 1. Workspace
    console.log('[INFO] [1/7] Coletando dados do Workspace Sicoob Sao Miguel...');
    const wsRes = await apiGet('/v4/workspaces/');
    const workspaceInfo = wsRes.data?.records?.[0] || {
        _id: DEFAULT_CONFIG.workspaceId,
        displayName: 'Sicoob Sao Miguel'
    };

    // 2. Servidores / Dispositivos
    console.log('[INFO] [2/7] Coletando servidores e dispositivos (Runners)...');
    const devRes = await apiGet(`/v4/workspaces/${DEFAULT_CONFIG.workspaceId}/devices`);
    const rawDevices = devRes.data?.records || [];
    
    const devices = [];
    const robotToDeviceMap = {};

    for (const d of rawDevices) {
        console.log(`[INFO] Processando metricas do servidor: ${d.name}...`);
        const statsRes = await apiGet(`/v4/devices/${d._id}/statistics`);
        const robotsRes = await apiGet(`/v4/devices/${d._id}/robots`);
        const linkedRobots = robotsRes.data?.records || [];

        linkedRobots.forEach(r => {
            robotToDeviceMap[r._id] = d.name;
        });

        devices.push({
            id: d._id,
            name: d.name,
            online: d.online,
            platform: d.platform,
            publicIp: d.publicIp,
            version: d.clientVersion,
            stats: statsRes.data || { seconds: 0, successCount: 0, errorCount: 0 },
            robots: linkedRobots.map(r => ({ id: r._id, name: r.name }))
        });
    }

    // 3. Execucoes em Andamento Agora (Now)
    console.log('[INFO] [3/7] Coletando robos rodando neste instante...');
    const nowRes = await apiGet(`/v4/studio/activity/now?workspace=${DEFAULT_CONFIG.workspaceId}`);
    const runningNow = (nowRes.data?.records || []).map(r => ({
        id: r._id,
        name: r.name,
        device: r.device?.name || robotToDeviceMap[r._id] || 'Servidor Nao Identificado',
        averageDuration: r.averageDuration || 0,
        startedAt: r.startedAt,
        designId: r.design?._id
    }));

    // 4. Proximas Execucoes Programadas (Soon)
    console.log('[INFO] [4/7] Coletando cronograma de proximas execucoes...');
    const soonRes = await apiGet(`/v4/studio/activity/soon?workspace=${DEFAULT_CONFIG.workspaceId}`);
    const scheduledSoon = (soonRes.data?.records || []).map(r => {
        const schedule = r.schedules?.[0] || {};
        return {
            id: r._id,
            name: r.name,
            device: r.device?.name || robotToDeviceMap[r._id] || 'Servidor Nao Identificado',
            averageDuration: r.averageDuration || 0,
            scheduleMode: schedule.scheduleMode || 'N/A',
            weekDays: schedule.weekDays || [],
            timePeriod: schedule.timePeriod || [],
            timeInterval: schedule.timeInterval || 'N/A',
            specificTimes: schedule.specificTimes || []
        };
    });

    // 5. Visao Geral de Execucoes (Overview)
    console.log('[INFO] [5/7] Coletando visao geral de todos os robos (Overview)...');
    const overviewRes = await apiGet(`/v4/studio/activity/overview?workspace=${DEFAULT_CONFIG.workspaceId}&limit=100`);
    const rawOverview = overviewRes.data?.records || [];

    const overview = rawOverview.map(r => {
        let devName = robotToDeviceMap[r._id] || 'N/A';
        if (devName === 'N/A') {
            if (r.name.startsWith('40')) devName = 'Roberty40(PRD)';
            else if (r.name.startsWith('20') || r.name.startsWith('D ') || r.name.startsWith('S ')) devName = 'Roberty20(PRD)';
            else if (r.name.startsWith('01') || r.name.startsWith('10')) devName = 'Roberty(UAD01)';
        }
        return {
            id: r._id,
            name: r.name,
            device: devName,
            runId: r.run?._id || null,
            startDate: r.run?.startDate || null,
            endDate: r.run?.endDate || null,
            duration: r.run?.duration !== undefined ? r.run.duration : null,
            success: r.run?.success !== undefined ? r.run.success : null
        };
    });

    // 6. Erros e Falhas Recentes
    console.log('[INFO] [6/7] Coletando historico de falhas recentes...');
    const errorsRes = await apiGet(`/v4/studio/activity/errors?workspace=${DEFAULT_CONFIG.workspaceId}`);
    const recentErrors = (errorsRes.data?.records || []).map(r => ({
        id: r._id,
        name: r.name,
        device: robotToDeviceMap[r._id] || (r.name.startsWith('40') ? 'Roberty40(PRD)' : 'Roberty20(PRD)'),
        runId: r.run?._id,
        startDate: r.run?.startDate,
        endDate: r.run?.endDate,
        duration: r.run?.duration,
        success: r.run?.success,
        markAsSolved: r.run?.markAsSolved
    }));

    // 7. Estatisticas Acumuladas
    console.log('[INFO] [7/7] Coletando estatisticas consolidadas dos ultimos 30 dias...');
    const nowDt = new Date();
    const past30Dt = new Date(nowDt.getTime() - 30 * 24 * 3600 * 1000);
    const statsRes = await apiGet(`/v4/studio/activity/statistics?workspace=${DEFAULT_CONFIG.workspaceId}&startDate=${past30Dt.toISOString()}&endDate=${nowDt.toISOString()}`);
    const rawStats = statsRes.data?.data || [];
    const statsMap = {};
    rawStats.forEach(s => {
        if (s.stats) {
            statsMap[s._id] = s.stats;
        }
    });

    // 8. Historico Detalhado de Disparos Recentes
    console.log('[INFO] Extraindo historico detalhado de disparos...');
    const detailedRuns = [];
    const activeRobotsWithRuns = overview.filter(r => r.runId);

    for (const r of activeRobotsWithRuns.slice(0, 35)) {
        try {
            const runsRes = await apiGet(`/v4/robots/${r.id}/runs?limit=10`);
            const records = runsRes.data?.records || [];
            records.forEach(run => {
                let devName = robotToDeviceMap[r.id] || r.device;
                if (!devName || devName === 'N/A') {
                    if (run.publicIp === '177.129.79.254') {
                        devName = r.name.startsWith('40') ? 'Roberty40(PRD)' : 'Roberty20(PRD)';
                    } else if (run.publicIp === '187.33.160.238') {
                        devName = 'Roberty(UAD01)';
                    } else {
                        devName = 'Servidor Producao';
                    }
                }
                detailedRuns.push({
                    runId: run._id,
                    robotId: r.id,
                    robotName: r.name,
                    device: devName,
                    publicIp: run.publicIp || 'N/A',
                    startDate: run.startDate,
                    endDate: run.endDate,
                    duration: run.duration !== undefined ? run.duration : 0,
                    success: run.success,
                    kind: run.kind || 'AUTOMATICO'
                });
            });
        } catch (e) {
            // Ignora falhas pontuais
        }
    }

    detailedRuns.sort((a, b) => new Date(b.startDate || 0) - new Date(a.startDate || 0));

    const totalSeconds = ((Date.now() - startTime) / 1000).toFixed(1);
    console.log(`[OK] Coleta concluida em ${totalSeconds}s! Execucoes consolidadas: ${detailedRuns.length}`);

    return {
        collectedAt: new Date().toISOString(),
        workspace: {
            id: workspaceInfo._id,
            name: workspaceInfo.displayName || 'Sicoob Sao Miguel',
            totalRobots: overview.length
        },
        devices,
        runningNow,
        scheduledSoon,
        overview,
        recentErrors,
        stats: statsMap,
        runs: detailedRuns
    };
}

// Formatador de Metricas para o Formato Padrao Prometheus
function generatePrometheusMetrics(data) {
    const lines = [];

    lines.push('# HELP roberty_up Status de funcionamento do coletor de telemetria Roberty');
    lines.push('# TYPE roberty_up gauge');
    lines.push('roberty_up 1');

    // 1. Status dos Servidores / Runners
    lines.push('# HELP roberty_runner_status Status do Runner de Producao (1 = Online, 0 = Offline)');
    lines.push('# TYPE roberty_runner_status gauge');
    for (const d of data.devices) {
        const val = d.online ? 1 : 0;
        lines.push(`roberty_runner_status{runner="${d.name}",ip="${d.publicIp}",platform="${d.platform}",version="${d.version}"} ${val}`);
    }

    // 2. Estatisticas Acumuladas dos Servidores
    lines.push('# HELP roberty_runner_success_runs_total Total acumulado de execucoes com sucesso no Runner');
    lines.push('# TYPE roberty_runner_success_runs_total counter');
    for (const d of data.devices) {
        lines.push(`roberty_runner_success_runs_total{runner="${d.name}"} ${d.stats.successCount || 0}`);
    }

    lines.push('# HELP roberty_runner_error_runs_total Total acumulado de execucoes com falha no Runner');
    lines.push('# TYPE roberty_runner_error_runs_total counter');
    for (const d of data.devices) {
        lines.push(`roberty_runner_error_runs_total{runner="${d.name}"} ${d.stats.errorCount || 0}`);
    }

    lines.push('# HELP roberty_runner_execution_seconds_total Total acumulado de segundos de processamento no Runner');
    lines.push('# TYPE roberty_runner_execution_seconds_total counter');
    for (const d of data.devices) {
        lines.push(`roberty_runner_execution_seconds_total{runner="${d.name}"} ${d.stats.seconds || 0}`);
    }

    // 3. Execucoes Rodando Agora
    lines.push('# HELP roberty_robots_running_now_total Total de robos executando em producao neste momento');
    lines.push('# TYPE roberty_robots_running_now_total gauge');
    lines.push(`roberty_robots_running_now_total ${data.runningNow.length}`);

    lines.push('# HELP roberty_robot_active Robos em execucao ativa agora (1 = executando)');
    lines.push('# TYPE roberty_robot_active gauge');
    for (const r of data.runningNow) {
        const sanitizedName = r.name.replace(/["\\]/g, '');
        lines.push(`roberty_robot_active{robot="${sanitizedName}",runner="${r.device}"} 1`);
    }

    // 4. Incidentes / Erros Recentes
    lines.push('# HELP roberty_recent_errors_total Total de incidentes com falha detectados nas ultimas rotinas');
    lines.push('# TYPE roberty_recent_errors_total gauge');
    lines.push(`roberty_recent_errors_total ${data.recentErrors.length}`);

    // 5. Robos Agendados
    lines.push('# HELP roberty_scheduled_robots_total Total de robos com agendamentos ativos na workspace');
    lines.push('# TYPE roberty_scheduled_robots_total gauge');
    lines.push(`roberty_scheduled_robots_total ${data.scheduledSoon.length}`);

    return lines.join('\n') + '\n';
}

function getContentType(filePath) {
    const ext = path.extname(filePath).toLowerCase();
    switch (ext) {
        case '.html': return 'text/html; charset=utf-8';
        case '.js': return 'application/javascript; charset=utf-8';
        case '.css': return 'text/css; charset=utf-8';
        case '.json': return 'application/json; charset=utf-8';
        case '.svg': return 'image/svg+xml';
        case '.png': return 'image/png';
        case '.ico': return 'image/x-icon';
        default: return 'application/octet-stream';
    }
}

// Iniciar Servidor Web Integrado
function startServer(data, port = 8080) {
    let currentData = data;
    const baseDir = __dirname;
    const reactDist = path.join(baseDir, 'frontend', 'dist');
    const legacyHtml = path.join(baseDir, 'PAINEL_MONITORAMENTO_ROBERTY.html');
    const jsonPath = path.join(baseDir, 'roberty_data.json');

    const hasReactDist = fs.existsSync(reactDist) && fs.existsSync(path.join(reactDist, 'index.html'));

    const server = http.createServer(async (req, res) => {
        res.setHeader('Access-Control-Allow-Origin', '*');
        res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
        res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With');

        if (req.method === 'OPTIONS') {
            res.writeHead(204);
            res.end();
            return;
        }

        const parsedUrl = new URL(req.url || '/', `http://localhost:${port}`);
        const pathname = parsedUrl.pathname;

        // 1. Endpoints de API
        if (pathname === '/metrics') {
            res.writeHead(200, { 'Content-Type': 'text/plain; version=0.0.4; charset=utf-8' });
            res.end(generatePrometheusMetrics(currentData));
            return;
        } else if (pathname === '/api/runs') {
            res.writeHead(200, { 'Content-Type': 'application/json; charset=utf-8' });
            res.end(JSON.stringify(currentData.runs));
            return;
        } else if (pathname === '/api/devices' || pathname === '/api/servers') {
            res.writeHead(200, { 'Content-Type': 'application/json; charset=utf-8' });
            res.end(JSON.stringify(currentData.devices));
            return;
        } else if (pathname === '/api/schedules') {
            res.writeHead(200, { 'Content-Type': 'application/json; charset=utf-8' });
            res.end(JSON.stringify(currentData.scheduledSoon));
            return;
        } else if (pathname === '/api/data') {
            res.writeHead(200, { 'Content-Type': 'application/json; charset=utf-8' });
            res.end(JSON.stringify(currentData));
            return;
        } else if (pathname === '/api/refresh') {
            console.log('[INFO] Sincronizacao sob demanda solicitada...');
            try {
                currentData = await collectMonitoringData();
                fs.writeFileSync(jsonPath, JSON.stringify(currentData, null, 2), 'utf8');
                res.writeHead(200, { 'Content-Type': 'application/json; charset=utf-8' });
                res.end(JSON.stringify({ status: 'OK', collectedAt: currentData.collectedAt, runs: currentData.runs.length }));
            } catch (err) {
                res.writeHead(500, { 'Content-Type': 'application/json' });
                res.end(JSON.stringify({ error: err.message }));
            }
            return;
        }

        // 2. Servir Arquivos Estaticos (React SPA do frontend/dist ou fallback HTML)
        if (hasReactDist) {
            let reqPath = path.join(reactDist, pathname === '/' ? 'index.html' : pathname);
            if (!fs.existsSync(reqPath)) {
                // SPA fallback para index.html
                reqPath = path.join(reactDist, 'index.html');
            }
            try {
                const content = fs.readFileSync(reqPath);
                res.writeHead(200, { 'Content-Type': getContentType(reqPath) });
                res.end(content);
                return;
            } catch {
                res.writeHead(404, { 'Content-Type': 'text/plain' });
                res.end('[ERRO] Arquivo nao encontrado');
                return;
            }
        } else {
            res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
            res.end(fs.readFileSync(legacyHtml, 'utf8'));
        }
    });

    server.listen(port, '0.0.0.0', () => {
        console.log(`\n==============================================================================`);
        console.log(`[SUCESSO] Servidor de Telemetria e Dashboard React Iniciado!`);
        console.log(`==============================================================================`);
        console.log(`[REACT APP] Painel Dinamico:    http://localhost:${port}/`);
        console.log(`[GRAFANA] Scrape Prometheus:    http://localhost:${port}/metrics`);
        console.log(`[GRAFANA] Infinity - Execucoes: http://localhost:${port}/api/runs`);
        console.log(`[GRAFANA] Infinity - Servidores:http://localhost:${port}/api/devices`);
        console.log(`[GRAFANA] Infinity - Agenda:    http://localhost:${port}/api/schedules`);
        console.log(`==============================================================================\n`);
    });

    return server;
}

// Modo Principal
async function main() {
    const args = process.argv.slice(2);
    const isServe = args.includes('--serve');
    const portIdx = args.indexOf('--port');
    const port = portIdx !== -1 && args[portIdx + 1] ? parseInt(args[portIdx + 1], 10) : DEFAULT_CONFIG.httpPort;

    try {
        const data = await collectMonitoringData();

        const baseDir = __dirname;
        const jsonPath = path.join(baseDir, 'roberty_data.json');
        fs.writeFileSync(jsonPath, JSON.stringify(data, null, 2), 'utf8');
        console.log(`[OK] Base de dados gerada em: ${jsonPath}`);

        // Atualizar copia no frontend/src tambem
        const frontendDataPath = path.join(baseDir, 'frontend', 'src', 'roberty_data.json');
        if (fs.existsSync(path.dirname(frontendDataPath))) {
            fs.writeFileSync(frontendDataPath, JSON.stringify(data, null, 2), 'utf8');
        }

        if (isServe) {
            startServer(data, port);
        }
    } catch (err) {
        console.error('[ERRO] Falha durante a execucao do monitor:', err);
        process.exit(1);
    }
}

if (require.main === module) {
    main();
}

module.exports = {
    collectMonitoringData,
    generatePrometheusMetrics,
    startServer
};
