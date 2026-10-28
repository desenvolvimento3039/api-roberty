import React, { useState, useEffect, useMemo } from 'react';
import initialData from './roberty_data.json';
import './App.css';
import {
  Server,
  PlayCircle,
  Calendar,
  AlertTriangle,
  Layers,
  RefreshCw,
  Download,
  Search,
  CheckCircle,
  XCircle,
  Clock,
  Activity,
  Cpu
} from 'lucide-react';

export default function App() {
  const [data, setData] = useState(initialData);
  const [activeTab, setActiveTab] = useState('live');
  const [isRefreshing, setIsRefreshing] = useState(false);
  const [refreshInterval, setRefreshInterval] = useState(30); // 30s padrão
  const [lastRefreshedAt, setLastRefreshedAt] = useState(new Date());

  // Filtros da aba de Histórico
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedServer, setSelectedServer] = useState('ALL');
  const [selectedStatus, setSelectedStatus] = useState('ALL');
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 15;

  // Função para buscar dados atualizados
  const fetchTelemetry = async (forceCloudRefresh = false) => {
    setIsRefreshing(true);
    try {
      const endpoint = forceCloudRefresh ? '/api/refresh' : '/api/data';
      const res = await fetch(endpoint);
      if (res.ok) {
        const json = await res.json();
        // Se for /api/refresh retorna { status: 'OK' }, então recarrega /api/data
        if (forceCloudRefresh) {
          const freshRes = await fetch('/api/data');
          if (freshRes.ok) {
            const freshData = await freshRes.json();
            setData(freshData);
          }
        } else {
          setData(json);
        }
        setLastRefreshedAt(new Date());
      }
    } catch (err) {
      console.warn('[WARN] Falha ao comunicar com backend local, operando com snapshot.');
    } finally {
      setIsRefreshing(false);
    }
  };

  // Efeito de auto-refresh periódico
  useEffect(() => {
    fetchTelemetry(false);
    if (refreshInterval <= 0) return;

    const timer = setInterval(() => {
      fetchTelemetry(false);
    }, refreshInterval * 1000);

    return () => clearInterval(timer);
  }, [refreshInterval]);

  // Efeito de tick para atualizar contador em tempo real dos robôs rodando
  const [, setTick] = useState(0);
  useEffect(() => {
    const clock = setInterval(() => setTick(t => t + 1), 1000);
    return () => clearInterval(clock);
  }, []);

  // Formatadores de data e duração
  const formatDate = (isoStr) => {
    if (!isoStr) return '-';
    try {
      const d = new Date(isoStr);
      if (isNaN(d.getTime())) return '-';
      return d.toLocaleString('pt-BR', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
      });
    } catch {
      return '-';
    }
  };

  const formatDuration = (seconds) => {
    if (seconds === null || seconds === undefined) return '-';
    if (seconds === 0) return '< 1s';
    const s = Math.round(seconds);
    const min = Math.floor(s / 60);
    const sec = s % 60;
    if (min === 0) return `${sec}s`;
    const hrs = Math.floor(min / 60);
    const remMin = min % 60;
    if (hrs === 0) return `${min}m ${sec}s`;
    return `${hrs}h ${remMin}m ${sec}s`;
  };

  // Filtro do Histórico de Execuções
  const filteredRuns = useMemo(() => {
    const list = data?.runs || [];
    return list.filter((r) => {
      const matchesSearch = !searchTerm || r.robotName.toLowerCase().includes(searchTerm.toLowerCase());
      const matchesServer = selectedServer === 'ALL' || r.device === selectedServer;
      let matchesStatus = true;
      if (selectedStatus === 'SUCCESS') matchesStatus = r.success === true;
      if (selectedStatus === 'ERROR') matchesStatus = r.success === false;
      return matchesSearch && matchesServer && matchesStatus;
    });
  }, [data?.runs, searchTerm, selectedServer, selectedStatus]);

  // Paginação
  const totalPages = Math.ceil(filteredRuns.length / pageSize) || 1;
  const paginatedRuns = useMemo(() => {
    const start = (currentPage - 1) * pageSize;
    return filteredRuns.slice(start, start + pageSize);
  }, [filteredRuns, currentPage]);

  // Exportação CSV
  const handleExportCsv = () => {
    const headers = ["Data_Inicio", "Data_Fim", "Nome_Robo", "Aonde_Rodou_Servidor", "IP_Servidor", "Duracao_Segundos", "Tipo_Disparo", "Status"];
    const rows = filteredRuns.map(r => [
      `"${r.startDate || ''}"`,
      `"${r.endDate || ''}"`,
      `"${(r.robotName || '').replace(/"/g, '""')}"`,
      `"${r.device || ''}"`,
      `"${r.publicIp || ''}"`,
      r.duration || 0,
      `"${r.kind || ''}"`,
      r.success ? "SUCESSO" : "ERRO"
    ]);

    const csvContent = "\uFEFF" + [headers.join(";"), ...rows.map(e => e.join(";"))].join("\r\n");
    const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = `relatorio_roberty_execucoes_${new Date().toISOString().slice(0, 10)}.csv`;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  const daysMap = { 1: "Seg", 2: "Ter", 3: "Qua", 4: "Qui", 5: "Sex", 6: "Sab", 7: "Dom" };

  return (
    <div className="app-wrapper">
      {/* Header Corporativo Sicoob */}
      <header className="app-header">
        <div className="header-branding">
          <span className="badge-coop">COOP 3039</span>
          <div className="header-title">
            <h1>Painel Dinâmico Roberty RPA (React)</h1>
            <p>Workspace: {data?.workspace?.name || 'Sicoob São Miguel'} | Servidores de Produção (Unattended)</p>
          </div>
        </div>

        <div className="header-actions">
          <select
            className="refresh-select"
            value={refreshInterval}
            onChange={(e) => setRefreshInterval(Number(e.target.value))}
            title="Intervalo de atualização automática"
          >
            <option value={0}>Auto-Refresh: Desativado</option>
            <option value={15}>Auto-Refresh: 15s</option>
            <option value={30}>Auto-Refresh: 30s</option>
            <option value={60}>Auto-Refresh: 60s</option>
          </select>

          <button className="btn-header" onClick={handleExportCsv} title="Exportar histórico atual para CSV">
            <Download size={14} /> [CSV] Exportar
          </button>

          <button
            className="btn-header primary"
            onClick={() => fetchTelemetry(true)}
            disabled={isRefreshing}
            title="Sincronizar telemetria em tempo real com a API Cloud da Roberty"
          >
            <RefreshCw size={14} className={isRefreshing ? 'spin-animation' : ''} />
            {isRefreshing ? '[SYNC...] Atualizando' : '[OK] Atualizar Agora'}
          </button>
        </div>
      </header>

      {/* Conteúdo Principal */}
      <main className="dashboard-main">
        {/* Grid de KPIs */}
        <section className="kpi-grid">
          <div className="kpi-card servers">
            <div className="kpi-header">
              <span className="kpi-title">[INFRA] Servidores Online</span>
              <Server size={18} color="var(--sicoob-lime)" />
            </div>
            <div className="kpi-value">
              {(data?.devices || []).filter(d => d.online).length} / {(data?.devices || []).length}
            </div>
            <div className="kpi-desc">Roberty40, Roberty20 e UAD01</div>
          </div>

          <div className="kpi-card running">
            <div className="kpi-header">
              <span className="kpi-title">[LIVE] Rodando Agora</span>
              <PlayCircle size={18} color="var(--running-color)" />
            </div>
            <div className="kpi-value">{data?.runningNow?.length || 0}</div>
            <div className="kpi-desc">Processos ativos nas máquinas virtuais</div>
          </div>

          <div className="kpi-card">
            <div className="kpi-header">
              <span className="kpi-title">[AGENDA] Robôs Programados</span>
              <Calendar size={18} color="var(--sicoob-teal)" />
            </div>
            <div className="kpi-value">{data?.scheduledSoon?.length || 0}</div>
            <div className="kpi-desc">Cronogramas de rotina configurados</div>
          </div>

          <div className="kpi-card alert">
            <div className="kpi-header">
              <span className="kpi-title">[ERROS] Falhas Recentes</span>
              <AlertTriangle size={18} color="var(--error-color)" />
            </div>
            <div className="kpi-value">{data?.recentErrors?.length || 0}</div>
            <div className="kpi-desc">Incidentes nas últimas execuções</div>
          </div>

          <div className="kpi-card">
            <div className="kpi-header">
              <span className="kpi-title">[TOTAL] Robôs Monitorados</span>
              <Layers size={18} color="var(--sicoob-dark)" />
            </div>
            <div className="kpi-value">{data?.overview?.length || 0}</div>
            <div className="kpi-desc">Catálogo corporativo completo</div>
          </div>
        </section>

        {/* Navegação por Abas */}
        <nav className="tab-nav">
          <button
            className={`tab-btn ${activeTab === 'live' ? 'active' : ''}`}
            onClick={() => setActiveTab('live')}
          >
            <Activity size={16} /> [LIVE] Em Execução
            <span className="tab-badge">{data?.runningNow?.length || 0}</span>
          </button>

          <button
            className={`tab-btn ${activeTab === 'history' ? 'active' : ''}`}
            onClick={() => setActiveTab('history')}
          >
            <Clock size={16} /> [AUDITORIA] Histórico Geral
            <span className="tab-badge">{data?.runs?.length || 0}</span>
          </button>

          <button
            className={`tab-btn ${activeTab === 'schedules' ? 'active' : ''}`}
            onClick={() => setActiveTab('schedules')}
          >
            <Calendar size={16} /> [CRONOGRAMA] Agendamentos
            <span className="tab-badge">{data?.scheduledSoon?.length || 0}</span>
          </button>

          <button
            className={`tab-btn ${activeTab === 'servers' ? 'active' : ''}`}
            onClick={() => setActiveTab('servers')}
          >
            <Cpu size={16} /> [INFRAESTRUTURA] Servidores
            <span className="tab-badge">{data?.devices?.length || 0}</span>
          </button>

          <button
            className={`tab-btn ${activeTab === 'errors' ? 'active' : ''}`}
            onClick={() => setActiveTab('errors')}
          >
            <AlertTriangle size={16} /> [INCIDENTES] Erros Recentes
            <span className="tab-badge">{data?.recentErrors?.length || 0}</span>
          </button>

          <button
            className={`tab-btn ${activeTab === 'overview' ? 'active' : ''}`}
            onClick={() => setActiveTab('overview')}
          >
            <Layers size={16} /> [CATÁLOGO] Todos os Robôs
            <span className="tab-badge">{data?.overview?.length || 0}</span>
          </button>
        </nav>

        {/* ABA 1: LIVE (EM EXECUÇÃO) */}
        {activeTab === 'live' && (
          <div className="table-card">
            <div className="table-header">
              <h2><PlayCircle size={18} color="var(--running-color)" /> [ATIVIDADE AO VIVO] Processos Executando Agora nos Servidores</h2>
              <span className="status-tag running">Monitoramento Ativo</span>
            </div>
            <div className="table-responsive">
              <table>
                <thead>
                  <tr>
                    <th>Robô RPA</th>
                    <th>Servidor / Máquina</th>
                    <th>Horário de Início</th>
                    <th>Tempo Decorrido</th>
                    <th>Duração Média Estimada</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  {(data?.runningNow || []).length === 0 ? (
                    <tr>
                      <td colSpan="6" style={{ textAlign: 'center', padding: '32px', color: 'var(--sicoob-muted)' }}>
                        [INFO] Nenhum robô executando neste exato momento nos servidores de produção.
                      </td>
                    </tr>
                  ) : (
                    data.runningNow.map((r) => {
                      const startTime = new Date(r.startedAt).getTime();
                      const elapsedSec = Math.max(0, Math.floor((Date.now() - startTime) / 1000));
                      return (
                        <tr key={r.id}>
                          <td><b>{r.name}</b></td>
                          <td><span className="server-tag">{r.device}</span></td>
                          <td>{formatDate(r.startedAt)}</td>
                          <td><b>{formatDuration(elapsedSec)}</b></td>
                          <td>{formatDuration(r.averageDuration)}</td>
                          <td><span className="status-tag running">[RODANDO AGORA]</span></td>
                        </tr>
                      );
                    })
                  )}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* ABA 2: HISTÓRICO GERAL (AUDITORIA) */}
        {activeTab === 'history' && (
          <div>
            <div className="filter-bar">
              <div className="filter-group">
                <label>Buscar Robô:</label>
                <div style={{ position: 'relative', display: 'flex', alignItems: 'center' }}>
                  <input
                    type="text"
                    className="filter-input"
                    placeholder="Digite o nome do robô..."
                    value={searchTerm}
                    onChange={(e) => {
                      setSearchTerm(e.target.value);
                      setCurrentPage(1);
                    }}
                  />
                </div>
              </div>

              <div className="filter-group">
                <label>Servidor / Runner:</label>
                <select
                  className="filter-select"
                  value={selectedServer}
                  onChange={(e) => {
                    setSelectedServer(e.target.value);
                    setCurrentPage(1);
                  }}
                >
                  <option value="ALL">Todos os Servidores</option>
                  <option value="Roberty40(PRD)">Roberty40(PRD)</option>
                  <option value="Roberty20(PRD)">Roberty20(PRD)</option>
                  <option value="Roberty(UAD01)">Roberty(UAD01)</option>
                </select>
              </div>

              <div className="filter-group">
                <label>Status do Disparo:</label>
                <select
                  className="filter-select"
                  value={selectedStatus}
                  onChange={(e) => {
                    setSelectedStatus(e.target.value);
                    setCurrentPage(1);
                  }}
                >
                  <option value="ALL">Todos os Status</option>
                  <option value="SUCCESS">[OK] Concluído com Sucesso</option>
                  <option value="ERROR">[ERRO] Falha na Execução</option>
                </select>
              </div>
            </div>

            <div className="table-card">
              <div className="table-header">
                <h2><Clock size={18} color="var(--sicoob-teal)" /> [HISTÓRICO] Registros de Execuções Consolidadas</h2>
                <span style={{ fontSize: '12px', fontWeight: 600, color: 'var(--sicoob-muted)' }}>
                  {filteredRuns.length} execuções encontradas
                </span>
              </div>
              <div className="table-responsive">
                <table>
                  <thead>
                    <tr>
                      <th>Início</th>
                      <th>Término</th>
                      <th>Nome do Robô</th>
                      <th>Aonde Rodou (Servidor)</th>
                      <th>IP de Origem</th>
                      <th>Duração</th>
                      <th>Tipo</th>
                      <th>Status Final</th>
                    </tr>
                  </thead>
                  <tbody>
                    {paginatedRuns.length === 0 ? (
                      <tr>
                        <td colSpan="8" style={{ textAlign: 'center', padding: '32px', color: 'var(--sicoob-muted)' }}>
                          [INFO] Nenhum registro encontrado para os filtros selecionados.
                        </td>
                      </tr>
                    ) : (
                      paginatedRuns.map((r, i) => (
                        <tr key={r.runId || i}>
                          <td>{formatDate(r.startDate)}</td>
                          <td>{formatDate(r.endDate)}</td>
                          <td><b>{r.robotName}</b></td>
                          <td><span className="server-tag">{r.device}</span></td>
                          <td style={{ fontFamily: 'monospace', fontSize: '12px' }}>{r.publicIp}</td>
                          <td><b>{formatDuration(r.duration)}</b></td>
                          <td><span style={{ background: '#eef2f3', padding: '2px 6px', borderRadius: '4px', fontSize: '11px' }}>{r.kind}</span></td>
                          <td>
                            {r.success ? (
                              <span className="status-tag success">[OK] SUCESSO</span>
                            ) : (
                              <span className="status-tag error">[ERRO] FALHA</span>
                            )}
                          </td>
                        </tr>
                      ))
                    )}
                  </tbody>
                </table>
              </div>
              <div className="pagination-box">
                <span>
                  Mostrando {filteredRuns.length > 0 ? (currentPage - 1) * pageSize + 1 : 0} a{' '}
                  {Math.min(currentPage * pageSize, filteredRuns.length)} de {filteredRuns.length} execuções
                </span>
                <div className="pagination-buttons">
                  <button
                    className="page-btn"
                    onClick={() => setCurrentPage(p => Math.max(1, p - 1))}
                    disabled={currentPage === 1}
                  >
                    Anterior
                  </button>
                  <span style={{ padding: '0 8px', fontWeight: 700 }}>
                    Página {currentPage} de {totalPages}
                  </span>
                  <button
                    className="page-btn"
                    onClick={() => setCurrentPage(p => Math.min(totalPages, p + 1))}
                    disabled={currentPage === totalPages}
                  >
                    Próxima
                  </button>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* ABA 3: AGENDAMENTOS & HORÁRIOS */}
        {activeTab === 'schedules' && (
          <div className="table-card">
            <div className="table-header">
              <h2><Calendar size={18} color="var(--sicoob-teal)" /> [CRONOGRAMA] Controle de Datas, Horários e Intervalos</h2>
              <span style={{ fontSize: '12px', color: 'var(--sicoob-muted)' }}>
                {data?.scheduledSoon?.length || 0} rotinas ativas
              </span>
            </div>
            <div className="table-responsive">
              <table>
                <thead>
                  <tr>
                    <th>Nome do Robô</th>
                    <th>Servidor Vinculado</th>
                    <th>Modo</th>
                    <th>Dias da Semana</th>
                    <th>Janela de Horários</th>
                    <th>Intervalo de Repetição</th>
                    <th>Duração Média</th>
                  </tr>
                </thead>
                <tbody>
                  {(data?.scheduledSoon || []).map((s) => {
                    const daysText = s.weekDays.length > 0
                      ? s.weekDays.map(d => daysMap[d] || d).join(', ')
                      : 'Todos os dias';
                    const windowText = s.timePeriod.length === 2
                      ? `${s.timePeriod[0]} às ${s.timePeriod[1]}`
                      : (s.specificTimes.length > 0 ? s.specificTimes.join(', ') : 'Programado');
                    return (
                      <tr key={s.id}>
                        <td><b>{s.name}</b></td>
                        <td><span className="server-tag">{s.device}</span></td>
                        <td>{s.scheduleMode.toUpperCase()}</td>
                        <td><b>{daysText}</b></td>
                        <td>{windowText}</td>
                        <td><span style={{ background: '#eef2f3', padding: '2px 6px', borderRadius: '4px', fontWeight: 600 }}>{s.timeInterval}</span></td>
                        <td>{formatDuration(s.averageDuration)}</td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* ABA 4: SERVIDORES & RUNNERS */}
        {activeTab === 'servers' && (
          <div className="servers-grid">
            {(data?.devices || []).map((d) => {
              const totalRuns = (d.stats.successCount || 0) + (d.stats.errorCount || 0);
              const successRate = totalRuns > 0 ? ((d.stats.successCount / totalRuns) * 100).toFixed(1) + '%' : '100%';
              return (
                <div className="server-card" key={d.id}>
                  <div className="server-card-header">
                    <span className="server-name">{d.name}</span>
                    <span className={`status-tag ${d.online ? 'success' : 'error'}`}>
                      {d.online ? '[ONLINE]' : '[OFFLINE]'}
                    </span>
                  </div>
                  <div style={{ fontSize: '12px', color: 'var(--sicoob-muted)', display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '6px', marginBottom: '12px' }}>
                    <div><b>IP Público:</b> {d.publicIp}</div>
                    <div><b>Plataforma:</b> {d.platform}</div>
                    <div><b>Versão Runner:</b> v{d.version}</div>
                    <div><b>Robôs Atribuídos:</b> {d.robots.length}</div>
                  </div>
                  <div className="server-stats-bar">
                    <div className="server-stat-item">
                      <div className="val" style={{ color: 'var(--success-color)' }}>{(d.stats.successCount || 0).toLocaleString()}</div>
                      <div className="lbl">Sucessos</div>
                    </div>
                    <div className="server-stat-item">
                      <div className="val" style={{ color: 'var(--error-color)' }}>{(d.stats.errorCount || 0).toLocaleString()}</div>
                      <div className="lbl">Falhas</div>
                    </div>
                    <div className="server-stat-item">
                      <div className="val">{successRate}</div>
                      <div className="lbl">Aproveitamento</div>
                    </div>
                  </div>
                  <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--sicoob-muted)', marginBottom: '6px', textTransform: 'uppercase' }}>
                    Robôs Vinculados a esta Máquina:
                  </div>
                  <div className="server-robots-box">
                    {d.robots.map(r => (
                      <div className="server-robot-row" key={r.id}>• {r.name}</div>
                    ))}
                  </div>
                </div>
              );
            })}
          </div>
        )}

        {/* ABA 5: INCIDENTES E FALHAS */}
        {activeTab === 'errors' && (
          <div className="table-card">
            <div className="table-header">
              <h2><AlertTriangle size={18} color="var(--error-color)" /> [INCIDENTES] Erros Detectados nas Execuções dos Servidores</h2>
              <span className="status-tag error">{data?.recentErrors?.length || 0} incidentes</span>
            </div>
            <div className="table-responsive">
              <table>
                <thead>
                  <tr>
                    <th>Nome do Robô</th>
                    <th>Servidor Afetado</th>
                    <th>Data/Hora da Falha</th>
                    <th>Tempo Decorrido até o Erro</th>
                    <th>ID de Execução (Run ID)</th>
                    <th>Ação Recomendada</th>
                  </tr>
                </thead>
                <tbody>
                  {(data?.recentErrors || []).length === 0 ? (
                    <tr>
                      <td colSpan="6" style={{ textAlign: 'center', padding: '32px', color: 'var(--success-color)' }}>
                        [OK] Nenhuma falha pendente detectada nos robôs de produção.
                      </td>
                    </tr>
                  ) : (
                    data.recentErrors.map((e, idx) => (
                      <tr key={e.runId || idx}>
                        <td><b>{e.name}</b></td>
                        <td><span className="server-tag">{e.device}</span></td>
                        <td>{formatDate(e.endDate || e.startDate)}</td>
                        <td><b>{formatDuration(e.duration)}</b></td>
                        <td><code style={{ fontSize: '11px', background: '#f0f0f0', padding: '2px 4px', borderRadius: '3px' }}>{e.runId || 'N/A'}</code></td>
                        <td><span className="status-tag error">[REVISAR LOG NO STUDIO]</span></td>
                      </tr>
                    ))
                  )}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* ABA 6: CATÁLOGO DE TODOS OS 63 ROBÔS */}
        {activeTab === 'overview' && (
          <div className="table-card">
            <div className="table-header">
              <h2><Layers size={18} color="var(--sicoob-dark)" /> [CATÁLOGO GERAL] Visão Consolidada de Todos os Robôs da Workspace</h2>
              <span style={{ fontSize: '12px', color: 'var(--sicoob-muted)' }}>
                {data?.overview?.length || 0} automações mapeadas
              </span>
            </div>
            <div className="table-responsive">
              <table>
                <thead>
                  <tr>
                    <th>Nome do Robô</th>
                    <th>Servidor Designado</th>
                    <th>Último Disparo</th>
                    <th>Último Término</th>
                    <th>Duração</th>
                    <th>Status Última Execução</th>
                  </tr>
                </thead>
                <tbody>
                  {(data?.overview || []).map((r) => {
                    let statusBadge = <span className="status-tag" style={{ background: '#e0e0e0', color: '#555' }}>[SEM DISPARO]</span>;
                    if (r.success === true) statusBadge = <span className="status-tag success">[OK] SUCESSO</span>;
                    else if (r.success === false) statusBadge = <span className="status-tag error">[ERRO] FALHA</span>;
                    return (
                      <tr key={r.id}>
                        <td><b>{r.name}</b></td>
                        <td><span className="server-tag">{r.device}</span></td>
                        <td>{formatDate(r.startDate)}</td>
                        <td>{formatDate(r.endDate)}</td>
                        <td>{formatDuration(r.duration)}</td>
                        <td>{statusBadge}</td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          </div>
        )}
      </main>

      {/* Footer */}
      <footer className="app-footer">
        <p>Painel Dinâmico de Monitoramento Roberty Automation (React) | Sicoob São Miguel (Coop 3039)</p>
        <p>Última sincronização local: {formatDate(lastRefreshedAt)}</p>
      </footer>
    </div>
  );
}
