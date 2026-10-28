FROM node:20-alpine

WORKDIR /app

# Variaveis de Ambiente Opcionais (com defaults seguros)
ENV PORT=8080
ENV NODE_ENV=production

COPY package.json ./
COPY roberty_collector.js ./
COPY export_to_sql.js ./
COPY PAINEL_MONITORAMENTO_ROBERTY.html ./
COPY roberty_data.json ./
COPY schema_roberty_grafana.sql ./
COPY grafana_dashboard_roberty.json ./

EXPOSE 8080

CMD ["node", "roberty_collector.js", "--serve", "--port", "8080"]
