@echo off
title Painel de Monitoramento Roberty RPA - Sicoob Sao Miguel
color 0A

echo ==============================================================================
echo [INFO] SICOOB SAO MIGUEL (COOP 3039) - ROBERTY RPA MONITOR
echo ==============================================================================
echo [INFO] Atualizando dados da telemetria de producao via API Roberty...
echo.

set NODE_EXE="C:\Users\jefferson.miguel\AppData\Roaming\roberty-studio-v4\vendor\node\24.22.1\node.exe"

if exist %NODE_EXE% (
    %NODE_EXE% "%~dp0roberty_collector.js"
) else (
    node "%~dp0roberty_collector.js"
)

echo.
echo [OK] Dados atualizados com sucesso!
echo [INFO] Abrindo o painel no navegador padrao...
start "" "%~dp0PAINEL_MONITORAMENTO_ROBERTY.html"
echo.
echo [INFO] Para iniciar o servidor web com atualizacao automatica, execute:
echo        %NODE_EXE% "%~dp0roberty_collector.js" --serve --port 8080
echo.
pause
