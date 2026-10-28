FROM node:20-alpine

WORKDIR /app

ENV PORT=8080
ENV NODE_ENV=production

# 1. Instalar dependencias e compilar o Frontend React
COPY frontend/package.json ./frontend/
WORKDIR /app/frontend
RUN npm install
COPY frontend/ ./
RUN npm run build

# 2. Preparar aplicacao principal
WORKDIR /app
COPY package.json ./
COPY roberty_collector.js ./
COPY export_to_sql.js ./
COPY PAINEL_MONITORAMENTO_ROBERTY.html ./
COPY roberty_data.json ./
COPY schema_roberty_grafana.sql ./
COPY grafana_dashboard_roberty.json ./

EXPOSE 8080

CMD ["node", "roberty_collector.js", "--serve", "--port", "8080"]
