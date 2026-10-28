@echo off
title Painel Dinamico Roberty RPA (React) - Sicoob Sao Miguel
color 0A

echo ==============================================================================
echo [INFO] SICOOB SAO MIGUEL (COOP 3039) - PAINEL DINAMICO REACT ROBERTY RPA
echo ==============================================================================
echo.
echo Escolha o modo de execucao:
echo [1] Iniciar Servidor Unificado de Producao (Recomendado - Porta 8080)
echo [2] Iniciar Modo Desenvolvimento React (Vite Hot-Reload - Porta 3000)
echo.
set /p MODO="Digite 1 ou 2 (Padrao: 1): "

if "%MODO%"=="2" goto MODO_DEV

:MODO_PROD
echo.
echo [INFO] Iniciando Servidor Unificado (Backend API + React SPA na porta 8080)...
start http://localhost:8080/
node roberty_collector.js --serve --port 8080
goto FIM

:MODO_DEV
echo.
echo [INFO] Iniciando Backend de Telemetria na porta 8080...
start cmd /k "node roberty_collector.js --serve --port 8080"
echo [INFO] Iniciando Vite Dev Server na pasta frontend...
cd frontend
start http://localhost:3000/
npm run dev

:FIM
pause
