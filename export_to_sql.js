const fs = require('fs');
const path = require('path');

const dataPath = path.join(__dirname, 'roberty_data.json');
if (!fs.existsSync(dataPath)) {
    console.error('[ERRO] Arquivo roberty_data.json nao encontrado.');
    process.exit(1);
}

const data = JSON.parse(fs.readFileSync(dataPath, 'utf8'));

const sqlLines = [];
sqlLines.push('-- Insercao de Dados Coletados do Roberty para o Grafana');
sqlLines.push('-- Gerado em: ' + data.collectedAt);
sqlLines.push('');

// 1. Devices / Runners
sqlLines.push('-- 1. SERVIDORES / RUNNERS');
for (const d of data.devices) {
    const escName = d.name.replace(/'/g, "''");
    const ip = d.publicIp || '';
    const platform = d.platform || 'WINDOWS';
    const ver = d.version || '4.2.7';
    const totalSec = d.stats.seconds || 0;
    const succ = d.stats.successCount || 0;
    const err = d.stats.errorCount || 0;
    const linked = d.robots?.length || 0;

    sqlLines.push(`INSERT INTO roberty_devices (device_id, name, online, platform, public_ip, client_version, total_seconds, success_count, error_count, linked_robots_count, updated_at)`);
    sqlLines.push(`VALUES ('${d.id}', '${escName}', ${d.online ? 'true' : 'false'}, '${platform}', '${ip}', '${ver}', ${totalSec}, ${succ}, ${err}, ${linked}, NOW())`);
    sqlLines.push(`ON CONFLICT (device_id) DO UPDATE SET online = EXCLUDED.online, total_seconds = EXCLUDED.total_seconds, success_count = EXCLUDED.success_count, error_count = EXCLUDED.error_count, updated_at = NOW();`);
    sqlLines.push('');
}

// 2. Runs
sqlLines.push('-- 2. EXECUCOES (RUNS)');
for (const r of data.runs) {
    const escRobot = (r.robotName || '').replace(/'/g, "''");
    const escDev = (r.device || '').replace(/'/g, "''");
    const ip = r.publicIp || '';
    const start = r.startDate ? `'${r.startDate}'` : 'NULL';
    const end = r.endDate ? `'${r.endDate}'` : 'NULL';
    const dur = r.duration !== undefined ? r.duration : 0;
    const succ = r.success ? 'true' : 'false';
    const kind = r.kind || 'AUTOMATICO';

    if (r.startDate) {
        sqlLines.push(`INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)`);
        sqlLines.push(`VALUES ('${r.runId}', '${r.robotId}', '${escRobot}', '${escDev}', '${ip}', ${start}, ${end}, ${dur}, ${succ}, '${kind}')`);
        sqlLines.push(`ON CONFLICT (run_id) DO NOTHING;`);
    }
}

// 3. Schedules
sqlLines.push('');
sqlLines.push('-- 3. AGENDAMENTOS (SCHEDULES)');
for (const s of data.scheduledSoon) {
    const escName = (s.name || '').replace(/'/g, "''");
    const escDev = (s.device || '').replace(/'/g, "''");
    const mode = s.scheduleMode || 'weekly';
    const days = (s.weekDays || []).join(',');
    const window = (s.timePeriod || []).join(' as ');
    const interval = s.timeInterval || '';
    const avgDur = s.averageDuration || 0;

    sqlLines.push(`INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)`);
    sqlLines.push(`VALUES ('${s.id}', '${escName}', '${escDev}', '${mode}', '${days}', '${window}', '${interval}', ${avgDur}, NOW())`);
    sqlLines.push(`ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();`);
}

const outPath = path.join(__dirname, 'dados_roberty_grafana.sql');
fs.writeFileSync(outPath, sqlLines.join('\n'), 'utf8');
console.log(`[OK] Script SQL com dados gerado em: ${outPath} (${sqlLines.length} linhas)`);
