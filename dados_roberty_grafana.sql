-- Insercao de Dados Coletados do Roberty para o Grafana
-- Gerado em: 2026-10-28T18:12:21.990Z

-- 1. SERVIDORES / RUNNERS
INSERT INTO roberty_devices (device_id, name, online, platform, public_ip, client_version, total_seconds, success_count, error_count, linked_robots_count, updated_at)
VALUES ('6a2aae144753f93619d886f7', 'Roberty40(PRD)', true, 'WINDOWS', '177.129.79.254', '4.2.7', 1618687, 13675, 472, 6, NOW())
ON CONFLICT (device_id) DO UPDATE SET online = EXCLUDED.online, total_seconds = EXCLUDED.total_seconds, success_count = EXCLUDED.success_count, error_count = EXCLUDED.error_count, updated_at = NOW();

INSERT INTO roberty_devices (device_id, name, online, platform, public_ip, client_version, total_seconds, success_count, error_count, linked_robots_count, updated_at)
VALUES ('6a3e9a7b81c7c406665f722b', 'Roberty20(PRD)', true, 'WINDOWS', '177.129.79.254', '4.2.7', 300357, 4661, 784, 10, NOW())
ON CONFLICT (device_id) DO UPDATE SET online = EXCLUDED.online, total_seconds = EXCLUDED.total_seconds, success_count = EXCLUDED.success_count, error_count = EXCLUDED.error_count, updated_at = NOW();

INSERT INTO roberty_devices (device_id, name, online, platform, public_ip, client_version, total_seconds, success_count, error_count, linked_robots_count, updated_at)
VALUES ('6ac8ed5998b3d5526c9b138d', 'Roberty(UAD01)', true, 'WINDOWS', '187.33.160.238', '4.2.7', 122966, 990, 138, 10, NOW())
ON CONFLICT (device_id) DO UPDATE SET online = EXCLUDED.online, total_seconds = EXCLUDED.total_seconds, success_count = EXCLUDED.success_count, error_count = EXCLUDED.error_count, updated_at = NOW();

-- 2. EXECUCOES (RUNS)
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae23a4ec4b9eac38e385000', '69e2787acb7a473b1e069353', '01 - Aprovações Conta Capital', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T18:09:18.000Z', '2026-10-28T18:12:00.000Z', 162, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae238d0c4b9eac38e3716e6', '69dcf00b5f85caa64f9b3d6c', '40 - Liberação Cheque Especial', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T18:02:56.148Z', NULL, 0, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae23897c4b9eac38e36e617', '69d5068fcd11ec868735fb0a', '20 - BNDES - Acompanhamento', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T18:01:57.000Z', '2026-10-28T18:02:11.000Z', 14, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae23865c4b9eac38e36b951', '6a6a35c12aabdd8fd3b65e99', '20 - BNDES Enquadramento Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T18:01:07.000Z', '2026-10-28T18:01:56.000Z', 49, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae2385bc4b9eac38e36af41', '6a6b52f70a210e12cc6dbecb', '20 - BNDES Vinculação Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T18:00:58.000Z', '2026-10-28T18:01:07.000Z', 9, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae23840c4b9eac38e368ddd', '69e2787acb7a473b1e069353', '01 - Aprovações Conta Capital', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T18:00:32.000Z', '2026-10-28T18:03:12.000Z', 160, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae2383dc4b9eac38e3689c6', '69fd3f8cc9c3c0a2c98172dd', '40 - Abrir e Fechar Bloco de Notas', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T18:00:29.000Z', '2026-10-28T18:00:59.000Z', 30, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae2382cc4b9eac38e367401', '69f249b964f708e2768587c1', '01 - Desligamento Cooperado Lecom', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T18:00:12.000Z', '2026-10-28T18:00:31.000Z', 19, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae234e1c4b9eac38e33f540', '6a6a35c12aabdd8fd3b65e99', '20 - BNDES Enquadramento Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T17:46:07.000Z', '2026-10-28T17:46:15.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae234d8c4b9eac38e33ec7d', '6a6b52f70a210e12cc6dbecb', '20 - BNDES Vinculação Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T17:45:58.000Z', '2026-10-28T17:46:07.000Z', 9, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae234a9c4b9eac38e33c53d', '69e2787acb7a473b1e069353', '01 - Aprovações Conta Capital', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T17:45:12.000Z', '2026-10-28T17:47:51.000Z', 159, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae231e2c4b9eac38e31afe7', '69d5068fcd11ec868735fb0a', '20 - BNDES - Acompanhamento', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T17:33:20.000Z', '2026-10-28T17:34:28.000Z', 68, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae231d9c4b9eac38e31a762', '6a6a35c12aabdd8fd3b65e99', '20 - BNDES Enquadramento Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T17:33:11.000Z', '2026-10-28T17:33:20.000Z', 9, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae23153c4b9eac38e31334b', '69fd3f8cc9c3c0a2c98172dd', '40 - Abrir e Fechar Bloco de Notas', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T17:30:59.000Z', '2026-10-28T17:31:26.000Z', 27, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae23153c4b9eac38e31330a', '6a6b52f70a210e12cc6dbecb', '20 - BNDES Vinculação Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T17:30:58.000Z', '2026-10-28T17:33:11.000Z', 133, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae23130c4b9eac38e31095a', '69e2787acb7a473b1e069353', '01 - Aprovações Conta Capital', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T17:30:23.000Z', '2026-10-28T17:33:03.000Z', 160, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae23124c4b9eac38e30f9f8', '69f249b964f708e2768587c1', '01 - Desligamento Cooperado Lecom', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T17:30:11.000Z', '2026-10-28T17:30:23.000Z', 12, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22efac4b9eac38e2f54bc', '69fd3f8cc9c3c0a2c98172dd', '40 - Abrir e Fechar Bloco de Notas', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T17:20:58.000Z', '2026-10-28T17:21:25.000Z', 27, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22ea3c4b9eac38e2f0d57', '6a6a35c12aabdd8fd3b65e99', '20 - BNDES Enquadramento Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T17:19:30.000Z', '2026-10-28T17:19:38.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22e63c4b9eac38e2ee0b4', '69fd3f8cc9c3c0a2c98172dd', '40 - Abrir e Fechar Bloco de Notas', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T17:18:27.000Z', '2026-10-28T17:18:55.000Z', 28, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22dcfc4b9eac38e2e4648', '6a6b52f70a210e12cc6dbecb', '20 - BNDES Vinculação Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T17:15:58.000Z', '2026-10-28T17:19:30.000Z', 212, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22da0c4b9eac38e2e2171', '69e2787acb7a473b1e069353', '01 - Aprovações Conta Capital', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T17:15:12.000Z', '2026-10-28T17:16:45.000Z', 93, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22a67c4b9eac38e2ba1f2', '6a6a35c12aabdd8fd3b65e99', '20 - BNDES Enquadramento Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T17:01:26.000Z', '2026-10-28T17:03:22.000Z', 116, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22a55c4b9eac38e2b8d96', '69d5068fcd11ec868735fb0a', '20 - BNDES - Acompanhamento', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T17:01:08.000Z', '2026-10-28T17:01:22.000Z', 14, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22a4bc4b9eac38e2b7ef0', '6a6b52f70a210e12cc6dbecb', '20 - BNDES Vinculação Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T17:00:57.000Z', '2026-10-28T17:01:07.000Z', 10, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22a28c4b9eac38e2b4df9', '69e2787acb7a473b1e069353', '01 - Aprovações Conta Capital', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T17:00:24.000Z', '2026-10-28T17:01:56.000Z', 92, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22a1cc4b9eac38e2b425b', '69f249b964f708e2768587c1', '01 - Desligamento Cooperado Lecom', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T17:00:11.000Z', '2026-10-28T17:00:23.000Z', 12, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22862c4b9eac38e29fe55', '6a50f383674eca6f007f3392', 'D 11:20 - 20 - Relatorio Etica e Integridade', 'Roberty20(PRD)', '187.33.160.238', '2026-10-28T16:52:50.000Z', '2026-10-28T16:57:13.000Z', 263, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22799c4b9eac38e296612', '6a50f383674eca6f007f3392', 'D 11:20 - 20 - Relatorio Etica e Integridade', 'Roberty20(PRD)', '187.33.160.238', '2026-10-28T16:49:28.000Z', '2026-10-28T16:49:47.000Z', 19, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae226c6c4b9eac38e28d027', '6a6b52f70a210e12cc6dbecb', '20 - BNDES Vinculação Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T16:45:57.000Z', '2026-10-28T16:46:06.000Z', 9, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22698c4b9eac38e28ae3e', '69e2787acb7a473b1e069353', '01 - Aprovações Conta Capital', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T16:45:11.000Z', '2026-10-28T16:47:52.000Z', 161, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae2234cc4b9eac38e264dee', '69d5068fcd11ec868735fb0a', '20 - BNDES - Acompanhamento', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T16:31:07.000Z', '2026-10-28T16:31:21.000Z', 14, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22343c4b9eac38e26462d', '6a6b52f70a210e12cc6dbecb', '20 - BNDES Vinculação Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T16:30:58.000Z', '2026-10-28T16:31:06.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae2231fc4b9eac38e2625b5', '69e2787acb7a473b1e069353', '01 - Aprovações Conta Capital', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T16:30:23.000Z', '2026-10-28T16:33:03.000Z', 160, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae22313c4b9eac38e261b25', '69f249b964f708e2768587c1', '01 - Desligamento Cooperado Lecom', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T16:30:11.000Z', '2026-10-28T16:30:23.000Z', 12, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae21fbec4b9eac38e23e55e', '6a6b52f70a210e12cc6dbecb', '20 - BNDES Vinculação Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T16:15:57.000Z', '2026-10-28T16:16:05.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae21f8fc4b9eac38e23c123', '69e2787acb7a473b1e069353', '01 - Aprovações Conta Capital', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T16:15:11.000Z', '2026-10-28T16:17:54.000Z', 163, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae21c44c4b9eac38e21936a', '69d5068fcd11ec868735fb0a', '20 - BNDES - Acompanhamento', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T16:01:07.000Z', '2026-10-28T16:01:20.000Z', 13, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae21c3ac4b9eac38e2186e6', '6a6b52f70a210e12cc6dbecb', '20 - BNDES Vinculação Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T16:00:57.000Z', '2026-10-28T16:01:06.000Z', 9, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae21c18c4b9eac38e21655a', '69e2787acb7a473b1e069353', '01 - Aprovações Conta Capital', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T16:00:24.000Z', '2026-10-28T16:03:04.000Z', 160, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae21c0bc4b9eac38e215709', '69f249b964f708e2768587c1', '01 - Desligamento Cooperado Lecom', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T16:00:11.000Z', '2026-10-28T16:00:23.000Z', 12, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae218b6c4b9eac38e1f1510', '6a6b52f70a210e12cc6dbecb', '20 - BNDES Vinculação Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T15:45:57.000Z', '2026-10-28T15:46:09.000Z', 12, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae2153cc4b9eac38e1cbdcb', '69d5068fcd11ec868735fb0a', '20 - BNDES - Acompanhamento', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T15:31:07.000Z', '2026-10-28T15:32:16.000Z', 69, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae21505c4b9eac38e1c834c', '6a4e92f4e0a326cd91fb86d5', '40 - Reclassificação Risco - CRL 3039', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T15:30:13.000Z', '2026-10-28T17:18:26.000Z', 6493, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae21503c4b9eac38e1c8124', '69f249b964f708e2768587c1', '01 - Desligamento Cooperado Lecom', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T15:30:11.000Z', '2026-10-28T15:30:23.000Z', 12, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae212dac4b9eac38e1b0985', '69fd3f8cc9c3c0a2c98172dd', '40 - Abrir e Fechar Bloco de Notas', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T15:20:58.000Z', '2026-10-28T15:21:27.000Z', 29, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae21099c4b9eac38e197418', '6a6a35c12aabdd8fd3b65e99', '20 - BNDES Enquadramento Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T15:11:20.000Z', '2026-10-28T15:12:17.000Z', 57, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae21082c4b9eac38e196155', '69fd3f8cc9c3c0a2c98172dd', '40 - Abrir e Fechar Bloco de Notas', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T15:10:58.000Z', '2026-10-28T15:11:28.000Z', 30, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae2104fc4b9eac38e192d55', '6a6a35c12aabdd8fd3b65e99', '20 - BNDES Enquadramento Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T15:10:06.000Z', '2026-10-28T15:10:50.000Z', 44, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20fbcc4b9eac38e18c3e4', '6a6a35c12aabdd8fd3b65e99', '20 - BNDES Enquadramento Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T15:07:39.000Z', '2026-10-28T15:07:47.000Z', 8, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20faac4b9eac38e18b4e2', '6adf5ca585dac0936f94a120', 'Roberty - Carteira de Credito - Baixa de Saldos e Liberacoes BRDE', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T15:07:21.000Z', '2026-10-28T15:07:21.000Z', 0, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20ef1c4b9eac38e183125', '69d5068fcd11ec868735fb0a', '20 - BNDES - Acompanhamento', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T15:04:16.000Z', '2026-10-28T15:07:20.000Z', 184, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20e29c4b9eac38e17a60d', '69fd3f8cc9c3c0a2c98172dd', '40 - Abrir e Fechar Bloco de Notas', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T15:00:57.000Z', '2026-10-28T15:01:24.000Z', 27, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20dfbc4b9eac38e177628', '69f249b964f708e2768587c1', '01 - Desligamento Cooperado Lecom', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T15:00:10.000Z', '2026-10-28T15:00:22.000Z', 12, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20dbec4b9eac38e174685', '6a4fe0a282ad17677ca769f6', 'D 11:00 - 20 - Relatórios Embaixador Sicoob', 'Roberty20(PRD)', '187.33.160.238', '2026-10-28T14:59:10.000Z', '2026-10-28T14:59:31.000Z', 21, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20bd1c4b9eac38e15c776', '69fd3f8cc9c3c0a2c98172dd', '40 - Abrir e Fechar Bloco de Notas', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T14:50:57.000Z', '2026-10-28T14:51:24.000Z', 27, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20ba8c4b9eac38e159e04', '6a50fbb60d04f6e6cd98e1a5', 'D 11:35 20 - Relatorio Consorcio', 'Roberty20(PRD)', '187.33.160.238', '2026-10-28T14:50:15.000Z', '2026-10-28T14:54:50.000Z', 275, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20b96c4b9eac38e159068', '6a50f383674eca6f007f3392', 'D 11:20 - 20 - Relatorio Etica e Integridade', 'Roberty20(PRD)', '187.33.160.238', '2026-10-28T14:49:58.000Z', '2026-10-28T14:50:15.000Z', 17, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20979c4b9eac38e140c19', '69fd3f8cc9c3c0a2c98172dd', '40 - Abrir e Fechar Bloco de Notas', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T14:40:57.000Z', '2026-10-28T14:41:24.000Z', 27, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20930c4b9eac38e13d2ad', '6a50fbb60d04f6e6cd98e1a5', 'D 11:35 20 - Relatorio Consorcio', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T14:39:43.000Z', '2026-10-28T14:45:38.000Z', 355, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20922c4b9eac38e13c8c7', '69d5068fcd11ec868735fb0a', '20 - BNDES - Acompanhamento', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T14:39:29.000Z', '2026-10-28T14:39:43.000Z', 14, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae208f3c4b9eac38e13a390', '6a848e2863313f843eb316ed', 'S 11:30 - 20 - Ubots - Cancelamento Seguros - Qua', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T14:38:42.000Z', '2026-10-28T14:39:28.000Z', 46, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae208cec4b9eac38e138914', '6a4fe0a282ad17677ca769f6', 'D 11:00 - 20 - Relatórios Embaixador Sicoob', 'Roberty20(PRD)', '187.33.160.238', '2026-10-28T14:38:05.000Z', '2026-10-28T14:39:02.000Z', 57, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae2076dc4b9eac38e128bec', '6a51018f1f7e527fed816962', 'D 11:30 - 20 - Relatorio Educacao Financeira', 'Roberty20(PRD)', '187.33.160.238', '2026-10-28T14:32:13.000Z', '2026-10-28T14:32:13.000Z', 0, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20721c4b9eac38e125188', '69fd3f8cc9c3c0a2c98172dd', '40 - Abrir e Fechar Bloco de Notas', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T14:30:57.000Z', '2026-10-28T14:31:25.000Z', 28, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20720c4b9eac38e124fc5', '6a51018f1f7e527fed816962', 'D 11:30 - 20 - Relatorio Educacao Financeira', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T14:30:55.000Z', '2026-10-28T14:37:32.000Z', 397, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20704c4b9eac38e1233a3', '69f249b964f708e2768587c1', '01 - Desligamento Cooperado Lecom', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T14:30:27.000Z', '2026-10-28T14:30:38.000Z', 11, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae204c8c4b9eac38e1080fa', '6a50f383674eca6f007f3392', 'D 11:20 - 20 - Relatorio Etica e Integridade', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T14:20:55.000Z', '2026-10-28T14:22:05.000Z', 70, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae204acc4b9eac38e106628', '6a50f383674eca6f007f3392', 'D 11:20 - 20 - Relatorio Etica e Integridade', 'Roberty20(PRD)', '187.33.160.238', '2026-10-28T14:20:28.000Z', '2026-10-28T14:20:56.000Z', 28, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20421c4b9eac38e0fe77e', '6a50f7fed33d7bc41dabab93', 'D 11:10 - 20 - Relatorio Riscos e Controles Singulares', 'Roberty20(PRD)', '187.33.160.238', '2026-10-28T14:18:08.000Z', '2026-10-28T14:18:09.000Z', 1, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae2039cc4b9eac38e0f5dfc', '6a50fe0d55f7991ca7e31baa', 'D 11:15 - 20 - Relatorio Publico', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T14:15:55.000Z', '2026-10-28T14:17:02.000Z', 67, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20270c4b9eac38e0e4910', '6a50f7fed33d7bc41dabab93', 'D 11:10 - 20 - Relatorio Riscos e Controles Singulares', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T14:10:55.000Z', '2026-10-28T14:11:39.000Z', 44, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae201fdc4b9eac38e0dda5f', '6a4fe0a282ad17677ca769f6', 'D 11:00 - 20 - Relatórios Embaixador Sicoob', 'Roberty20(PRD)', '187.33.160.238', '2026-10-28T14:09:00.000Z', '2026-10-28T14:10:20.000Z', 80, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae200b3c4b9eac38e0cd4ad', '69d5068fcd11ec868735fb0a', '20 - BNDES - Acompanhamento', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T14:03:30.000Z', '2026-10-28T14:03:45.000Z', 15, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae20018c4b9eac38e0c4fba', '6a4fe0a282ad17677ca769f6', 'D 11:00 - 20 - Relatórios Embaixador Sicoob', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T14:00:55.000Z', '2026-10-28T14:01:40.000Z', 45, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1fffbc4b9eac38e0c2e7f', '69f249b964f708e2768587c1', '01 - Desligamento Cooperado Lecom', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T14:00:26.000Z', '2026-10-28T14:00:37.000Z', 11, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1fd20c4b9eac38e09a65d', '69dcf00b5f85caa64f9b3d6c', '40 - Liberação Cheque Especial', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T13:48:16.000Z', '2026-10-28T14:18:46.000Z', 1830, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1fa36c4b9eac38e075261', '69d5068fcd11ec868735fb0a', '20 - BNDES - Acompanhamento', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T13:35:49.000Z', '2026-10-28T13:36:02.000Z', 13, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1f90fc4b9eac38e063bb4', '6a56e6431c9080c7cb3aae8a', 'D 10:30 - 20 - Ubots - Inad Credito 35 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T13:30:54.000Z', '2026-10-28T13:31:18.000Z', 24, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1f8f2c4b9eac38e061f36', '69f249b964f708e2768587c1', '01 - Desligamento Cooperado Lecom', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T13:30:26.000Z', '2026-10-28T13:34:02.000Z', 216, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1f803c4b9eac38e055281', '6a56e61c1c9080c7cb3aae79', 'D 10:25 - 20 - Ubots - Inad Credito 25 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T13:26:26.000Z', '2026-10-28T13:27:37.000Z', 71, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1f7f4c4b9eac38e054919', '6a56e5f81c9080c7cb3aae68', 'D 10:20 - 20 -Ubots -  Inad Credito 03 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T13:26:11.000Z', '2026-10-28T13:26:26.000Z', 15, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1f6e8c4b9eac38e046a85', '6a6a35c12aabdd8fd3b65e99', '20 - BNDES Enquadramento Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T13:21:43.000Z', '2026-10-28T13:26:11.000Z', 268, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1f58bc4b9eac38e03523e', '6a56e5881c9080c7cb3aae46', 'D 10:15 - 20 - Ubots - Inad TD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T13:15:54.000Z', '2026-10-28T13:17:08.000Z', 74, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1f45fc4b9eac38e02539c', '6a56e5c71c9080c7cb3aae57', 'D 10:10 - 20 - Ubots - Inad AD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T13:10:54.000Z', '2026-10-28T13:12:03.000Z', 69, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1f332c4b9eac38e01804d', '6a56e396408dff01d5f079f9', 'D 10:05 - 20 - Ubots - Cotas Pendentes', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T13:05:54.000Z', '2026-10-28T13:06:10.000Z', 16, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1f28fc4b9eac38e0102da', '6a6a35c12aabdd8fd3b65e99', '20 - BNDES Enquadramento Novo', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T13:03:10.000Z', '2026-10-28T13:03:22.000Z', 12, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1e83ec4b9eac38ef7cca5', '69df96b41841d175877bdec2', '20 - Download de convênios', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T12:19:09.000Z', '2026-10-28T12:20:56.000Z', 107, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1e640c4b9eac38ef55ff1', '69df96b41841d175877bdec2', '20 - Download de convênios', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T12:10:39.000Z', '2026-10-28T12:12:18.000Z', 99, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1e021c4b9eac38eefb902', '6a4e92f4e0a326cd91fb86d5', '40 - Reclassificação Risco - CRL 3039', 'Roberty40(PRD)', '177.129.79.254', '2026-10-28T11:44:33.000Z', '2026-10-28T11:52:42.000Z', 489, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1e019c4b9eac38eefb371', '69df96b41841d175877bdec2', '20 - Download de convênios', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T11:44:24.000Z', '2026-10-28T11:46:01.000Z', 97, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1ddfdc4b9eac38eee05db', '69c5674cce8501c95b4e5503', '01 - Relatorio Ficha Cobrança', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T11:35:24.000Z', '2026-10-28T11:35:35.000Z', 11, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1dc08c4b9eac38eeb9148', '69c5674cce8501c95b4e5503', '01 - Relatorio Ficha Cobrança', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T11:27:03.000Z', '2026-10-28T11:27:14.000Z', 11, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1dab5c4b9eac38eea88b3', '69c5674cce8501c95b4e5503', '01 - Relatorio Ficha Cobrança', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T11:21:25.000Z', '2026-10-28T11:27:03.000Z', 338, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1d370c4b9eac38ee34fb6', '69c68d47b8206691e25fd7cc', '01 - Relatório Câmbio', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T10:50:24.000Z', '2026-10-28T10:50:44.000Z', 20, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1d20dc4b9eac38ee24215', '69df96b41841d175877bdec2', '20 - Download de convênios', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T10:44:28.000Z', '2026-10-28T10:46:01.000Z', 93, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1d1f2c4b9eac38ee22c61', '6a7f2155dfbf1d88d0e66c3c', '01 - Importacao Aplicacoes LCI LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T10:44:01.000Z', '2026-10-28T10:44:12.000Z', 11, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1d18fc4b9eac38ee1f092', '69c68d47b8206691e25fd7cc', '01 - Relatório Câmbio', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T10:42:22.000Z', '2026-10-28T10:44:00.000Z', 98, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1cf4ec4b9eac38ee0a55f', '6a6a10696f0732ec155741c7', '01 - Importacao Dados LCI', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T10:32:46.000Z', '2026-10-28T10:42:21.000Z', 575, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1cf42c4b9eac38ee099c9', '6a68df778c1f58ababa1b36f', '01 - Importacao Dados LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T10:32:33.000Z', '2026-10-28T10:32:44.000Z', 11, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1cdfbc4b9eac38edfd1c6', '6a7f2155dfbf1d88d0e66c3c', '01 - Importacao Aplicacoes LCI LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T10:27:07.000Z', '2026-10-28T10:32:33.000Z', 326, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1cc85c4b9eac38edf02db', '69df96b41841d175877bdec2', '20 - Download de convênios', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T10:20:52.000Z', '2026-10-28T10:22:25.000Z', 93, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1cb96c4b9eac38ede76ca', '6a6a10696f0732ec155741c7', '01 - Importacao Dados LCI', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T10:16:54.000Z', '2026-10-28T10:27:06.000Z', 612, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1ca59c4b9eac38eddc570', '6a68df778c1f58ababa1b36f', '01 - Importacao Dados LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T10:11:37.000Z', '2026-10-28T10:16:53.000Z', 316, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1ca2dc4b9eac38eddad71', '69df96b41841d175877bdec2', '20 - Download de convênios', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T10:10:52.000Z', '2026-10-28T10:12:24.000Z', 92, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1ca24c4b9eac38edda85d', '6a6a158941de8fd49d45e070', '01 - Relatório Estornos Débito Automático', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T10:10:43.000Z', '2026-10-28T10:11:36.000Z', 53, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1ca18c4b9eac38edda063', '69b816639a73e49fab6ecf7b', '01 - Relatórios Risco', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T10:10:32.000Z', '2026-10-28T10:10:43.000Z', 11, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1c7d4c4b9eac38edc501a', '69df96b41841d175877bdec2', '20 - Download de convênios', 'Roberty20(PRD)', '177.129.79.254', '2026-10-28T10:00:51.000Z', '2026-10-28T10:02:42.000Z', 111, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1c246c4b9eac38ed94f84', '69b816639a73e49fab6ecf7b', '01 - Relatórios Risco', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T09:37:09.000Z', '2026-10-28T09:56:23.000Z', 1154, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1c1d0c4b9eac38ed910b4', '6a6a158941de8fd49d45e070', '01 - Relatório Estornos Débito Automático', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T09:35:11.000Z', '2026-10-28T09:37:08.000Z', 117, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1c1b9c4b9eac38ed904a6', '69c5674cce8501c95b4e5503', '01 - Relatorio Ficha Cobrança', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T09:34:49.000Z', '2026-10-28T09:34:59.000Z', 10, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1bd66c4b9eac38ed6a090', '6a6a158941de8fd49d45e070', '01 - Relatório Estornos Débito Automático', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T09:16:22.000Z', '2026-10-28T09:19:33.000Z', 191, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1bc27c4b9eac38ed5f3d0', '69c5674cce8501c95b4e5503', '01 - Relatorio Ficha Cobrança', 'Roberty(UAD01)', '187.33.160.238', '2026-10-28T09:11:02.000Z', '2026-10-28T09:16:22.000Z', 320, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae10ca1c4b9eac38e79175c', '6a4e92f4e0a326cd91fb86d5', '40 - Reclassificação Risco - CRL 3039', 'Roberty40(PRD)', '177.129.79.254', '2026-10-27T20:42:09.000Z', '2026-10-27T23:36:04.000Z', 10435, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae1037bc4b9eac38e7278fb', '69dcf00b5f85caa64f9b3d6c', '40 - Liberação Cheque Especial', 'Roberty40(PRD)', '177.129.79.254', '2026-10-27T20:03:06.000Z', '2026-10-27T20:26:14.000Z', 1388, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0f71bc4b9eac38e68d80c', '69dcf00b5f85caa64f9b3d6c', '40 - Liberação Cheque Especial', 'Roberty40(PRD)', '177.129.79.254', '2026-10-27T19:10:19.000Z', '2026-10-27T20:01:10.000Z', 3051, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0f511c4b9eac38e674b2b', '69dcf00b5f85caa64f9b3d6c', '40 - Liberação Cheque Especial', 'Roberty40(PRD)', '177.129.79.254', '2026-10-27T19:01:37.000Z', '2026-10-27T19:10:15.000Z', 518, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0d842c4b9eac38e4f513f', '69dcf00b5f85caa64f9b3d6c', '40 - Liberação Cheque Especial', 'Roberty40(PRD)', '177.129.79.254', '2026-10-27T16:58:42.000Z', '2026-10-27T17:00:12.000Z', 90, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0c97dc4b9eac38e447b54', '69dcf00b5f85caa64f9b3d6c', '40 - Liberação Cheque Especial', 'Roberty40(PRD)', '177.129.79.254', '2026-10-27T15:55:41.000Z', '2026-10-27T16:58:41.000Z', 3780, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0c874c4b9eac38e43c292', '69dcf00b5f85caa64f9b3d6c', '40 - Liberação Cheque Especial', 'Roberty40(PRD)', '177.129.79.254', '2026-10-27T15:51:16.000Z', '2026-10-27T15:52:10.000Z', 54, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0c7e0c4b9eac38e43596a', '69dcf00b5f85caa64f9b3d6c', '40 - Liberação Cheque Especial', 'Roberty40(PRD)', '177.129.79.254', '2026-10-27T15:48:48.000Z', '2026-10-27T15:49:41.000Z', 53, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0c444c4b9eac38e40eb56', '69dcf00b5f85caa64f9b3d6c', '40 - Liberação Cheque Especial', 'Roberty40(PRD)', '177.129.79.254', '2026-10-27T15:33:24.000Z', '2026-10-27T15:48:48.000Z', 924, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0bed8c4b9eac38e3d27f9', '6a4e92f4e0a326cd91fb86d5', '40 - Reclassificação Risco - CRL 3039', 'Roberty40(PRD)', '177.129.79.254', '2026-10-27T15:10:16.000Z', '2026-10-27T15:23:14.000Z', 778, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0b7c2c4b9eac38e37e5ee', '6a50fbb60d04f6e6cd98e1a5', 'D 11:35 20 - Relatorio Consorcio', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T14:40:02.000Z', '2026-10-27T14:45:57.000Z', 355, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0b591c4b9eac38e362845', '6a51018f1f7e527fed816962', 'D 11:30 - 20 - Relatorio Educacao Financeira', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T14:30:40.000Z', '2026-10-27T14:37:15.000Z', 395, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0b338c4b9eac38e345f53', '6a50f383674eca6f007f3392', 'D 11:20 - 20 - Relatorio Etica e Integridade', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T14:20:40.000Z', '2026-10-27T14:21:52.000Z', 72, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0b20be8e077c4c173ec80', '6a50fe0d55f7991ca7e31baa', 'D 11:15 - 20 - Relatorio Publico', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T14:15:39.000Z', '2026-10-27T14:16:46.000Z', 67, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0b0e0e8e077c4c172fa55', '6a50f7fed33d7bc41dabab93', 'D 11:10 - 20 - Relatorio Riscos e Controles Singulares', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T14:10:39.000Z', '2026-10-27T14:11:27.000Z', 48, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0ae8be8e077c4c1710880', '6a4fe0a282ad17677ca769f6', 'D 11:00 - 20 - Relatórios Embaixador Sicoob', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T14:00:43.000Z', '2026-10-27T14:01:28.000Z', 45, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0a77fe8e077c4c16b697f', '6a56e6431c9080c7cb3aae8a', 'D 10:30 - 20 - Ubots - Inad Credito 35 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T13:30:39.000Z', '2026-10-27T13:32:20.000Z', 101, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0a653e8e077c4c16a860c', '6a56e61c1c9080c7cb3aae79', 'D 10:25 - 20 - Ubots - Inad Credito 25 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T13:25:39.000Z', '2026-10-27T13:27:11.000Z', 92, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0a527e8e077c4c16993c7', '6a56e5f81c9080c7cb3aae68', 'D 10:20 - 20 -Ubots -  Inad Credito 03 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T13:20:39.000Z', '2026-10-27T13:21:00.000Z', 21, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0a3fbe8e077c4c168b3fc', '6a56e5881c9080c7cb3aae46', 'D 10:15 - 20 - Ubots - Inad TD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T13:15:39.000Z', '2026-10-27T13:16:57.000Z', 78, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0a2cfe8e077c4c167d358', '6a56e5c71c9080c7cb3aae57', 'D 10:10 - 20 - Ubots - Inad AD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T13:10:39.000Z', '2026-10-27T13:11:56.000Z', 77, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0a1a3e8e077c4c166f8ca', '6a56e396408dff01d5f079f9', 'D 10:05 - 20 - Ubots - Cotas Pendentes', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T13:05:39.000Z', '2026-10-27T13:05:49.000Z', 10, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae08ed0e8e077c4c157c362', '6a6a10696f0732ec155741c7', '01 - Importacao Dados LCI', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T11:45:20.000Z', '2026-10-27T11:52:51.000Z', 451, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae08c70e8e077c4c155b64e', '69c5674cce8501c95b4e5503', '01 - Relatorio Ficha Cobrança', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T11:35:12.000Z', '2026-10-27T11:35:21.000Z', 9, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae08a6ee8e077c4c153d938', '69c5674cce8501c95b4e5503', '01 - Relatorio Ficha Cobrança', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T11:26:38.000Z', '2026-10-27T11:26:48.000Z', 10, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae08928e8e077c4c152b76d', '69c5674cce8501c95b4e5503', '01 - Relatorio Ficha Cobrança', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T11:21:11.000Z', '2026-10-27T11:26:37.000Z', 326, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae08459e8e077c4c14eead1', '69c68d47b8206691e25fd7cc', '01 - Relatório Câmbio', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T11:00:41.000Z', '2026-10-27T11:01:00.000Z', 19, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae08029e8e077c4c14c1cde', '6a6a10696f0732ec155741c7', '01 - Importacao Dados LCI', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T10:42:49.000Z', '2026-10-27T11:00:40.000Z', 1071, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae07fe8e8e077c4c14bf547', '69c68d47b8206691e25fd7cc', '01 - Relatório Câmbio', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T10:41:44.000Z', '2026-10-27T10:42:48.000Z', 64, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae07fdee8e077c4c14bed45', '6a68df778c1f58ababa1b36f', '01 - Importacao Dados LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T10:41:34.000Z', '2026-10-27T10:41:44.000Z', 10, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae07e91e8e077c4c14b36af', '6a7f2155dfbf1d88d0e66c3c', '01 - Importacao Aplicacoes LCI LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T10:36:01.000Z', '2026-10-27T10:41:33.000Z', 332, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae07d0fe8e077c4c14a5aba', '6a6a10696f0732ec155741c7', '01 - Importacao Dados LCI', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T10:29:34.000Z', '2026-10-27T10:36:00.000Z', 386, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae07bd9e8e077c4c149b708', '6a68df778c1f58ababa1b36f', '01 - Importacao Dados LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T10:24:25.000Z', '2026-10-27T10:29:33.000Z', 308, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae07b8fe8e077c4c14991c2', '6a6a158941de8fd49d45e070', '01 - Relatório Estornos Débito Automático', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T10:23:11.000Z', '2026-10-27T10:24:03.000Z', 52, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae07af3e8e077c4c14936a9', '69df96b41841d175877bdec2', '20 - Download de convênios', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T10:20:35.000Z', '2026-10-27T10:20:41.000Z', 6, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae0789be8e077c4c147e381', '69df96b41841d175877bdec2', '20 - Download de convênios', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T10:10:35.000Z', '2026-10-27T10:10:44.000Z', 9, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae076f0e8e077c4c146fc13', '69b816639a73e49fab6ecf7b', '01 - Relatórios Risco', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T10:03:28.000Z', '2026-10-27T10:23:10.000Z', 1182, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae07643e8e077c4c1468453', '69df96b41841d175877bdec2', '20 - Download de convênios', 'Roberty20(PRD)', '177.129.79.254', '2026-10-27T10:00:35.000Z', '2026-10-27T10:02:43.000Z', 128, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae07049e8e077c4c1436b6c', '69b816639a73e49fab6ecf7b', '01 - Relatórios Risco', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T09:35:04.000Z', '2026-10-27T09:49:49.000Z', 885, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae06fe9e8e077c4c14339b8', '6a6a158941de8fd49d45e070', '01 - Relatório Estornos Débito Automático', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T09:33:29.000Z', '2026-10-27T09:34:55.000Z', 86, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae06c5fe8e077c4c1414fd8', '69c5674cce8501c95b4e5503', '01 - Relatorio Ficha Cobrança', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T09:18:22.000Z', '2026-10-27T09:18:30.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae06b82e8e077c4c140dd40', '6a6a158941de8fd49d45e070', '01 - Relatório Estornos Débito Automático', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T09:14:42.000Z', '2026-10-27T09:18:13.000Z', 211, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ae06a5be8e077c4c14046a9', '69c5674cce8501c95b4e5503', '01 - Relatorio Ficha Cobrança', 'Roberty(UAD01)', '187.33.160.238', '2026-10-27T09:09:46.000Z', '2026-10-27T09:14:42.000Z', 296, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf6696e8e077c4c1a3549a', '6a50fbb60d04f6e6cd98e1a5', 'D 11:35 20 - Relatorio Consorcio', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T14:41:26.000Z', '2026-10-26T14:47:22.000Z', 356, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf6402e8e077c4c1a118a5', '6a51018f1f7e527fed816962', 'D 11:30 - 20 - Relatorio Educacao Financeira', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T14:30:27.000Z', '2026-10-26T14:37:06.000Z', 399, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf61aae8e077c4c19f1e17', '6a50f383674eca6f007f3392', 'D 11:20 - 20 - Relatorio Etica e Integridade', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T14:20:26.000Z', '2026-10-26T14:21:32.000Z', 66, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf607ee8e077c4c19e187d', '6a50fe0d55f7991ca7e31baa', 'D 11:15 - 20 - Relatorio Publico', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T14:15:26.000Z', '2026-10-26T14:16:26.000Z', 60, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf5f52e8e077c4c19d183c', '6a50f7fed33d7bc41dabab93', 'D 11:10 - 20 - Relatorio Riscos e Controles Singulares', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T14:10:26.000Z', '2026-10-26T14:11:13.000Z', 47, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf5cf9e8e077c4c19b0cce', '6a4fe0a282ad17677ca769f6', 'D 11:00 - 20 - Relatórios Embaixador Sicoob', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T14:00:26.000Z', '2026-10-26T14:01:33.000Z', 67, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf55f1e8e077c4c19493a7', '6a56e6431c9080c7cb3aae8a', 'D 10:30 - 20 - Ubots - Inad Credito 35 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T13:30:26.000Z', '2026-10-26T13:35:48.000Z', 322, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf5530e8e077c4c193f335', '6a56e61c1c9080c7cb3aae79', 'D 10:25 - 20 - Ubots - Inad Credito 25 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T13:27:12.000Z', '2026-10-26T13:29:19.000Z', 127, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf5433e8e077c4c1932ad5', '6a56e5f81c9080c7cb3aae68', 'D 10:20 - 20 -Ubots -  Inad Credito 03 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T13:22:59.000Z', '2026-10-26T13:27:11.000Z', 252, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf526de8e077c4c191936b', '6a56e5881c9080c7cb3aae46', 'D 10:15 - 20 - Ubots - Inad TD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T13:15:26.000Z', '2026-10-26T13:18:22.000Z', 176, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf5141e8e077c4c190a4c9', '6a56e5c71c9080c7cb3aae57', 'D 10:10 - 20 - Ubots - Inad AD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T13:10:25.000Z', '2026-10-26T13:12:40.000Z', 135, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf5015e8e077c4c18fb3b9', '6a56e396408dff01d5f079f9', 'D 10:05 - 20 - Ubots - Cotas Pendentes', 'Roberty20(PRD)', '177.129.79.254', '2026-10-26T13:05:25.000Z', '2026-10-26T13:05:38.000Z', 13, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf44fee8e077c4c186e5d2', '6a6a10696f0732ec155741c7', '01 - Importacao Dados LCI', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T12:18:06.000Z', '2026-10-26T12:23:14.000Z', 308, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf39f3e8e077c4c17e9226', '6a6a10696f0732ec155741c7', '01 - Importacao Dados LCI', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T11:30:58.000Z', '2026-10-26T11:35:28.000Z', 270, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf3078e8e077c4c1771cbc', '69c68d47b8206691e25fd7cc', '01 - Relatório Câmbio', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:50:32.000Z', '2026-10-26T10:50:39.000Z', 7, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf2e21e8e077c4c175a595', '69c68d47b8206691e25fd7cc', '01 - Relatório Câmbio', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:40:32.000Z', '2026-10-26T10:40:40.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf2d4de8e077c4c175374a', '6a7f2155dfbf1d88d0e66c3c', '01 - Importacao Aplicacoes LCI LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:37:01.000Z', '2026-10-26T10:37:05.000Z', 4, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf2c41e8e077c4c174a8ad', '6a6a10696f0732ec155741c7', '01 - Importacao Dados LCI', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:32:32.000Z', '2026-10-26T10:37:00.000Z', 268, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf2bcde8e077c4c1745b18', '69c68d47b8206691e25fd7cc', '01 - Relatório Câmbio', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:30:36.000Z', '2026-10-26T10:31:24.000Z', 48, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf2bc9e8e077c4c174584c', '6a68df778c1f58ababa1b36f', '01 - Importacao Dados LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:30:32.000Z', '2026-10-26T10:30:36.000Z', 4, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf2affe8e077c4c173f279', '6a7f2155dfbf1d88d0e66c3c', '01 - Importacao Aplicacoes LCI LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:27:10.000Z', '2026-10-26T10:27:14.000Z', 4, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf29e8e8e077c4c173622d', '6a6a10696f0732ec155741c7', '01 - Importacao Dados LCI', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:22:32.000Z', '2026-10-26T10:27:10.000Z', 278, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf29bde8e077c4c1734c0f', '6a68df778c1f58ababa1b36f', '01 - Importacao Dados LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:21:48.000Z', '2026-10-26T10:21:52.000Z', 4, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf28eae8e077c4c172d3ca', '6a7f2155dfbf1d88d0e66c3c', '01 - Importacao Aplicacoes LCI LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:18:18.000Z', '2026-10-26T10:21:48.000Z', 210, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf27dde8e077c4c1724692', '6a6a10696f0732ec155741c7', '01 - Importacao Dados LCI', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:13:48.000Z', '2026-10-26T10:18:17.000Z', 269, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf2718e8e077c4c171dd42', '6a68df778c1f58ababa1b36f', '01 - Importacao Dados LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:10:32.000Z', '2026-10-26T10:13:48.000Z', 196, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf269de8e077c4c1719dc6', '6a6a158941de8fd49d45e070', '01 - Relatório Estornos Débito Automático', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:08:29.000Z', '2026-10-26T10:09:04.000Z', 35, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf2698e8e077c4c1719a5a', '69b816639a73e49fab6ecf7b', '01 - Relatórios Risco', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T10:08:24.000Z', '2026-10-26T10:08:28.000Z', 4, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf2107e8e077c4c16ec454', '69b816639a73e49fab6ecf7b', '01 - Relatórios Risco', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T09:44:38.000Z', '2026-10-26T09:57:59.000Z', 801, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adf1c05e8e077c4c16c4a25', '6a6a158941de8fd49d45e070', '01 - Relatório Estornos Débito Automático', 'Roberty(UAD01)', '187.33.160.238', '2026-10-26T09:23:16.000Z', '2026-10-26T09:26:15.000Z', 179, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb7606e8e077c4c17fb805', '6a4e92f4e0a326cd91fb86d5', '40 - Reclassificação Risco - CRL 3039', 'Roberty40(PRD)', '177.129.79.254', '2026-10-23T14:58:13.000Z', '2026-10-23T15:11:04.000Z', 771, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb715fe8e077c4c17bc6e0', '6a50fbb60d04f6e6cd98e1a5', 'D 11:35 20 - Relatorio Consorcio', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T14:38:22.000Z', '2026-10-23T14:44:22.000Z', 360, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb6f8be8e077c4c17a43d8', '6a51018f1f7e527fed816962', 'D 11:30 - 20 - Relatorio Educacao Financeira', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T14:30:34.000Z', '2026-10-23T14:37:05.000Z', 391, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb6d32e8e077c4c1785a3a', '6a50f383674eca6f007f3392', 'D 11:20 - 20 - Relatorio Etica e Integridade', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T14:20:34.000Z', '2026-10-23T14:21:39.000Z', 65, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb6c06e8e077c4c17780a4', '6a50fe0d55f7991ca7e31baa', 'D 11:15 - 20 - Relatorio Publico', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T14:15:34.000Z', '2026-10-23T14:16:33.000Z', 59, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb6adae8e077c4c176b62c', '6a50f7fed33d7bc41dabab93', 'D 11:10 - 20 - Relatorio Riscos e Controles Singulares', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T14:10:34.000Z', '2026-10-23T14:11:15.000Z', 41, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb6883e8e077c4c174c8c4', '6a4fe0a282ad17677ca769f6', 'D 11:00 - 20 - Relatórios Embaixador Sicoob', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T14:00:35.000Z', '2026-10-23T14:01:22.000Z', 47, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb63d5e8e077c4c1714c57', '6a56e6431c9080c7cb3aae8a', 'D 10:30 - 20 - Ubots - Inad Credito 35 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T13:40:37.000Z', '2026-10-23T13:41:27.000Z', 50, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb6393e8e077c4c1711557', '6a56e61c1c9080c7cb3aae79', 'D 10:25 - 20 - Ubots - Inad Credito 25 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T13:39:31.000Z', '2026-10-23T13:40:36.000Z', 65, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb5f22e8e077c4c16d6e4e', '6a56e5f81c9080c7cb3aae68', 'D 10:20 - 20 -Ubots -  Inad Credito 03 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T13:20:34.000Z', '2026-10-23T13:39:30.000Z', 1136, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb5df6e8e077c4c16c1b64', '6a56e5881c9080c7cb3aae46', 'D 10:15 - 20 - Ubots - Inad TD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T13:15:34.000Z', '2026-10-23T13:16:14.000Z', 40, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb5ccae8e077c4c16b0246', '6a56e5c71c9080c7cb3aae57', 'D 10:10 - 20 - Ubots - Inad AD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T13:10:34.000Z', '2026-10-23T13:10:41.000Z', 7, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb5b9ee8e077c4c169fd1a', '6a56e396408dff01d5f079f9', 'D 10:05 - 20 - Ubots - Cotas Pendentes', 'Roberty20(PRD)', '177.129.79.254', '2026-10-23T13:05:34.000Z', '2026-10-23T13:05:57.000Z', 23, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb3bf9e8e077c4c1503578', '69c68d47b8206691e25fd7cc', '01 - Relatório Câmbio', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T10:50:32.000Z', '2026-10-23T10:50:42.000Z', 10, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb39a1e8e077c4c14e87f2', '69c68d47b8206691e25fd7cc', '01 - Relatório Câmbio', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T10:40:33.000Z', '2026-10-23T10:40:41.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb38ede8e077c4c14e0fc9', '6a7f2155dfbf1d88d0e66c3c', '01 - Importacao Aplicacoes LCI LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T10:37:32.000Z', '2026-10-23T10:37:37.000Z', 5, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb374de8e077c4c14cf260', '69c68d47b8206691e25fd7cc', '01 - Relatório Câmbio', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T10:30:37.000Z', '2026-10-23T10:31:26.000Z', 49, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb3748e8e077c4c14cedbe', '6a68df778c1f58ababa1b36f', '01 - Importacao Dados LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T10:30:32.000Z', '2026-10-23T10:30:36.000Z', 4, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb3667e8e077c4c14c783c', '6a7f2155dfbf1d88d0e66c3c', '01 - Importacao Aplicacoes LCI LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T10:26:46.000Z', '2026-10-23T10:26:50.000Z', 4, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb3550e8e077c4c14bdac3', '6a68df778c1f58ababa1b36f', '01 - Importacao Dados LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T10:22:07.000Z', '2026-10-23T10:22:13.000Z', 6, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb347ee8e077c4c14b5eb3', '6a7f2155dfbf1d88d0e66c3c', '01 - Importacao Aplicacoes LCI LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T10:18:37.000Z', '2026-10-23T10:22:07.000Z', 210, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb3298e8e077c4c14a458c', '6a68df778c1f58ababa1b36f', '01 - Importacao Dados LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T10:10:32.000Z', '2026-10-23T10:13:54.000Z', 202, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb3039e8e077c4c148d688', '6a6a158941de8fd49d45e070', '01 - Relatório Estornos Débito Automático', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T10:00:25.000Z', '2026-10-23T10:00:36.000Z', 11, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb3033e8e077c4c148d288', '69b816639a73e49fab6ecf7b', '01 - Relatórios Risco', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T10:00:19.000Z', '2026-10-23T10:00:25.000Z', 6, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb2ae5e8e077c4c1461157', '69b816639a73e49fab6ecf7b', '01 - Relatórios Risco', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T09:37:41.000Z', '2026-10-23T09:51:13.000Z', 812, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6adb292fe8e077c4c14521a9', '6a6a158941de8fd49d45e070', '01 - Relatório Estornos Débito Automático', 'Roberty(UAD01)', '187.33.160.238', '2026-10-23T09:30:23.000Z', '2026-10-23T09:30:59.000Z', 36, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada1fa6e8e077c4c197c406', '6a50fbb60d04f6e6cd98e1a5', 'D 11:35 20 - Relatorio Consorcio', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T14:37:25.000Z', '2026-10-22T14:43:24.000Z', 359, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada1df9e8e077c4c1963f66', '6a51018f1f7e527fed816962', 'D 11:30 - 20 - Relatorio Educacao Financeira', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T14:30:16.000Z', '2026-10-22T14:36:53.000Z', 397, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada1ba1e8e077c4c1945438', '6a50f383674eca6f007f3392', 'D 11:20 - 20 - Relatorio Etica e Integridade', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T14:20:16.000Z', '2026-10-22T14:21:27.000Z', 71, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada1a75e8e077c4c19363a1', '6a50fe0d55f7991ca7e31baa', 'D 11:15 - 20 - Relatorio Publico', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T14:15:16.000Z', '2026-10-22T14:16:22.000Z', 66, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada1949e8e077c4c1928116', '6a50f7fed33d7bc41dabab93', 'D 11:10 - 20 - Relatorio Riscos e Controles Singulares', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T14:10:16.000Z', '2026-10-22T14:11:01.000Z', 45, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada16f0e8e077c4c190abcd', '6a4fe0a282ad17677ca769f6', 'D 11:00 - 20 - Relatórios Embaixador Sicoob', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T14:00:16.000Z', '2026-10-22T14:00:58.000Z', 42, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada0fe8e8e077c4c18b05c1', '6a56e6431c9080c7cb3aae8a', 'D 10:30 - 20 - Ubots - Inad Credito 35 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T13:30:15.000Z', '2026-10-22T13:30:47.000Z', 32, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada0ebce8e077c4c18a3ae0', '6a56e61c1c9080c7cb3aae79', 'D 10:25 - 20 - Ubots - Inad Credito 25 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T13:25:16.000Z', '2026-10-22T13:25:30.000Z', 14, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada0d90e8e077c4c1896966', '6a56e5f81c9080c7cb3aae68', 'D 10:20 - 20 -Ubots -  Inad Credito 03 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T13:20:15.000Z', '2026-10-22T13:24:31.000Z', 256, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada0c64e8e077c4c18888a3', '6a56e5881c9080c7cb3aae46', 'D 10:15 - 20 - Ubots - Inad TD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T13:15:15.000Z', '2026-10-22T13:16:04.000Z', 49, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada0b38e8e077c4c187a14c', '6a56e5c71c9080c7cb3aae57', 'D 10:10 - 20 - Ubots - Inad AD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T13:10:16.000Z', '2026-10-22T13:10:23.000Z', 7, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ada0a0ce8e077c4c186c8a3', '6a56e396408dff01d5f079f9', 'D 10:05 - 20 - Ubots - Cotas Pendentes', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T13:05:15.000Z', '2026-10-22T13:05:25.000Z', 10, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad9fc46e8e077c4c17b1ab7', '6a50f7fed33d7bc41dabab93', 'D 11:10 - 20 - Relatorio Riscos e Controles Singulares', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T12:06:30.000Z', '2026-10-22T12:07:13.000Z', 43, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad9faafe8e077c4c1798d9e', '6a4fe0a282ad17677ca769f6', 'D 11:00 - 20 - Relatórios Embaixador Sicoob', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T11:59:42.000Z', '2026-10-22T12:04:33.000Z', 291, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad9fa63e8e077c4c1793b49', '6a4fe0a282ad17677ca769f6', 'D 11:00 - 20 - Relatórios Embaixador Sicoob', 'Roberty20(PRD)', '177.129.79.254', '2026-10-22T11:58:27.000Z', '2026-10-22T11:59:14.000Z', 47, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad9e237e8e077c4c166e430', '6a7f2155dfbf1d88d0e66c3c', '01 - Importacao Aplicacoes LCI LCA', 'Roberty(UAD01)', '187.33.160.238', '2026-10-22T10:15:19.000Z', '2026-10-22T10:15:23.000Z', 4, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad9dd04e8e077c4c163fb0b', '69b816639a73e49fab6ecf7b', '01 - Relatórios Risco', 'Roberty(UAD01)', '187.33.160.238', '2026-10-22T09:53:07.000Z', '2026-10-22T09:53:14.000Z', 7, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad9d7abe8e077c4c1612049', '69b816639a73e49fab6ecf7b', '01 - Relatórios Risco', 'Roberty(UAD01)', '187.33.160.238', '2026-10-22T09:30:19.000Z', '2026-10-22T09:44:14.000Z', 835, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8ef60e8e077c4c1c1dd74', '6a50f383674eca6f007f3392', 'D 11:20 - 20 - Relatorio Etica e Integridade', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T16:59:11.000Z', '2026-10-21T17:00:24.000Z', 73, false, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8ce69e8e077c4c1ab0317', '6a50fbb60d04f6e6cd98e1a5', 'D 11:35 20 - Relatorio Consorcio', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T14:38:32.000Z', '2026-10-21T14:44:31.000Z', 359, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8ce29e8e077c4c1aad02a', '6a848e2863313f843eb316ed', 'S 11:30 - 20 - Ubots - Cancelamento Seguros - Qua', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T14:37:28.000Z', '2026-10-21T14:38:09.000Z', 41, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8cc92e8e077c4c1a97d42', '6a51018f1f7e527fed816962', 'D 11:30 - 20 - Relatorio Educacao Financeira', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T14:30:41.000Z', '2026-10-21T14:37:19.000Z', 398, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8c90ee8e077c4c1a693e5', '6a50fe0d55f7991ca7e31baa', 'D 11:15 - 20 - Relatorio Publico', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T14:15:41.000Z', '2026-10-21T14:16:46.000Z', 65, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8c7e2e8e077c4c1a596e5', '6a50f7fed33d7bc41dabab93', 'D 11:10 - 20 - Relatorio Riscos e Controles Singulares', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T14:10:41.000Z', '2026-10-21T14:11:50.000Z', 69, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8be82e8e077c4c19d8410', '6a56e6431c9080c7cb3aae8a', 'D 10:30 - 20 - Ubots - Inad Credito 35 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T13:30:41.000Z', '2026-10-21T13:31:31.000Z', 50, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8bd55e8e077c4c19c5f28', '6a56e61c1c9080c7cb3aae79', 'D 10:25 - 20 - Ubots - Inad Credito 25 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T13:25:40.000Z', '2026-10-21T13:25:48.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8bc29e8e077c4c19b6496', '6a56e5f81c9080c7cb3aae68', 'D 10:20 - 20 -Ubots -  Inad Credito 03 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T13:20:41.000Z', '2026-10-21T13:20:56.000Z', 15, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8bafde8e077c4c19a55ed', '6a56e5881c9080c7cb3aae46', 'D 10:15 - 20 - Ubots - Inad TD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T13:15:40.000Z', '2026-10-21T13:16:54.000Z', 74, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8b9d1e8e077c4c1995d53', '6a56e5c71c9080c7cb3aae57', 'D 10:10 - 20 - Ubots - Inad AD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T13:10:40.000Z', '2026-10-21T13:11:57.000Z', 77, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8b8a5e8e077c4c1986e8b', '6a56e396408dff01d5f079f9', 'D 10:05 - 20 - Ubots - Cotas Pendentes', 'Roberty20(PRD)', '177.129.79.254', '2026-10-21T13:05:40.000Z', '2026-10-21T13:05:55.000Z', 15, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad8a5d6e8e077c4c1896af7', '6a4e92f4e0a326cd91fb86d5', '40 - Reclassificação Risco - CRL 3039', 'Roberty40(PRD)', '177.129.79.254', '2026-10-21T11:45:27.000Z', '2026-10-21T11:55:28.000Z', 601, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad7a81de8e077c4c1f582dd', '6a4e92f4e0a326cd91fb86d5', '40 - Reclassificação Risco - CRL 3039', 'Roberty40(PRD)', '177.129.79.254', '2026-10-20T17:42:52.000Z', '2026-10-20T17:54:01.000Z', 669, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad77d03e8e077c4c1d4c01f', '6a50fbb60d04f6e6cd98e1a5', 'D 11:35 20 - Relatorio Consorcio', 'Roberty20(PRD)', '177.129.79.254', '2026-10-20T14:38:58.000Z', '2026-10-20T14:44:45.000Z', 347, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad77b04d802d44ebdcaff6d', '6a51018f1f7e527fed816962', 'D 11:30 - 20 - Relatorio Educacao Financeira', 'Roberty20(PRD)', '177.129.79.254', '2026-10-20T14:30:28.000Z', '2026-10-20T14:36:59.000Z', 391, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad77780d802d44ebdc8676c', '6a50fe0d55f7991ca7e31baa', 'D 11:15 - 20 - Relatorio Publico', 'Roberty20(PRD)', '177.129.79.254', '2026-10-20T14:15:28.000Z', '2026-10-20T14:16:22.000Z', 54, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad77655d802d44ebdc78b71', '6a50f7fed33d7bc41dabab93', 'D 11:10 - 20 - Relatorio Riscos e Controles Singulares', 'Roberty20(PRD)', '177.129.79.254', '2026-10-20T14:10:28.000Z', '2026-10-20T14:11:37.000Z', 69, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad76cf4d802d44ebdbf6732', '6a56e6431c9080c7cb3aae8a', 'D 10:30 - 20 - Ubots - Inad Credito 35 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-20T13:30:28.000Z', '2026-10-20T13:35:28.000Z', 300, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad76bc8d802d44ebdbe75a0', '6a56e61c1c9080c7cb3aae79', 'D 10:25 - 20 - Ubots - Inad Credito 25 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-20T13:25:27.000Z', '2026-10-20T13:27:50.000Z', 143, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad76aa0d802d44ebdbd8d0f', '6a56e5f81c9080c7cb3aae68', 'D 10:20 - 20 -Ubots -  Inad Credito 03 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-20T13:20:31.000Z', '2026-10-20T13:22:13.000Z', 102, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad76970d802d44ebdbc8ea3', '6a56e5881c9080c7cb3aae46', 'D 10:15 - 20 - Ubots - Inad TD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-20T13:15:28.000Z', '2026-10-20T13:18:05.000Z', 157, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad76844d802d44ebdbb77b7', '6a56e5c71c9080c7cb3aae57', 'D 10:10 - 20 - Ubots - Inad AD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-20T13:10:27.000Z', '2026-10-20T13:12:12.000Z', 105, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad76718d802d44ebdba4950', '6a56e396408dff01d5f079f9', 'D 10:05 - 20 - Ubots - Cotas Pendentes', 'Roberty20(PRD)', '177.129.79.254', '2026-10-20T13:05:27.000Z', '2026-10-20T13:05:37.000Z', 10, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad65329d802d44ebd119b69', '6a4e92f4e0a326cd91fb86d5', '40 - Reclassificação Risco - CRL 3039', 'Roberty40(PRD)', '177.129.79.254', '2026-10-19T17:28:09.000Z', '2026-10-19T17:35:09.000Z', 420, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad62b23d802d44ebdf323f5', '6a50fbb60d04f6e6cd98e1a5', 'D 11:35 20 - Relatorio Consorcio', 'Roberty20(PRD)', '177.129.79.254', '2026-10-19T14:37:23.000Z', '2026-10-19T14:43:21.000Z', 358, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad62979d802d44ebdf1c27b', '6a51018f1f7e527fed816962', 'D 11:30 - 20 - Relatorio Educacao Financeira', 'Roberty20(PRD)', '177.129.79.254', '2026-10-19T14:30:18.000Z', '2026-10-19T14:36:54.000Z', 396, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad625f5d802d44ebdeee989', '6a50fe0d55f7991ca7e31baa', 'D 11:15 - 20 - Relatorio Publico', 'Roberty20(PRD)', '177.129.79.254', '2026-10-19T14:15:18.000Z', '2026-10-19T14:16:17.000Z', 59, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad624c9d802d44ebdedf3ba', '6a50f7fed33d7bc41dabab93', 'D 11:10 - 20 - Relatorio Riscos e Controles Singulares', 'Roberty20(PRD)', '177.129.79.254', '2026-10-19T14:10:17.000Z', '2026-10-19T14:11:29.000Z', 72, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad62146d802d44ebdea92c8', '6a56e6431c9080c7cb3aae8a', 'D 10:30 - 20 - Ubots - Inad Credito 35 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-19T13:55:18.000Z', '2026-10-19T13:56:34.000Z', 76, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad6209ed802d44ebdea000c', '6a56e61c1c9080c7cb3aae79', 'D 10:25 - 20 - Ubots - Inad Credito 25 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-19T13:52:30.000Z', '2026-10-19T13:55:18.000Z', 168, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad61910d802d44ebde36ff8', '6a56e5f81c9080c7cb3aae68', 'D 10:20 - 20 -Ubots -  Inad Credito 03 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-19T13:20:17.000Z', '2026-10-19T13:52:30.000Z', 1933, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad617e5d802d44ebde28479', '6a56e5881c9080c7cb3aae46', 'D 10:15 - 20 - Ubots - Inad TD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-19T13:15:17.000Z', '2026-10-19T13:17:33.000Z', 136, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad616b8d802d44ebde18e5b', '6a56e5c71c9080c7cb3aae57', 'D 10:10 - 20 - Ubots - Inad AD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-19T13:10:16.000Z', '2026-10-19T13:12:02.000Z', 106, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad6158dd802d44ebde09850', '6a56e396408dff01d5f079f9', 'D 10:05 - 20 - Ubots - Cotas Pendentes', 'Roberty20(PRD)', '177.129.79.254', '2026-10-19T13:05:17.000Z', '2026-10-19T13:05:35.000Z', 18, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad251b4d802d44ebdd55311', '6a4e92f4e0a326cd91fb86d5', '40 - Reclassificação Risco - CRL 3039', 'Roberty40(PRD)', '177.129.79.254', '2026-10-16T16:32:52.000Z', '2026-10-16T16:41:24.000Z', 512, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad23944d802d44ebdc49087', '6a50fbb60d04f6e6cd98e1a5', 'D 11:35 20 - Relatorio Consorcio', 'Roberty20(PRD)', '177.129.79.254', '2026-10-16T14:48:35.000Z', '2026-10-16T14:54:35.000Z', 360, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad23741d802d44ebdc2d61c', '6a51018f1f7e527fed816962', 'D 11:30 - 20 - Relatorio Educacao Financeira', 'Roberty20(PRD)', '177.129.79.254', '2026-10-16T14:40:00.000Z', '2026-10-16T14:46:35.000Z', 395, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad236bcd802d44ebdc274cc', '6a50fe0d55f7991ca7e31baa', 'D 11:15 - 20 - Relatorio Publico', 'Roberty20(PRD)', '177.129.79.254', '2026-10-16T14:37:48.000Z', '2026-10-16T14:38:48.000Z', 60, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad2334bd802d44ebdbf5676', '6a56e6431c9080c7cb3aae8a', 'D 10:30 - 20 - Ubots - Inad Credito 35 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-16T14:23:07.000Z', '2026-10-16T14:30:12.000Z', 425, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad2321ed802d44ebdbe572a', '6a56e61c1c9080c7cb3aae79', 'D 10:25 - 20 - Ubots - Inad Credito 25 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-16T14:18:06.000Z', '2026-10-16T14:23:06.000Z', 300, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad224abd802d44ebdb18dec', '6a56e5f81c9080c7cb3aae68', 'D 10:20 - 20 -Ubots -  Inad Credito 03 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-16T13:20:42.000Z', '2026-10-16T14:18:05.000Z', 3443, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad2237ed802d44ebdb07377', '6a56e5881c9080c7cb3aae46', 'D 10:15 - 20 - Ubots - Inad TD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-16T13:15:41.000Z', '2026-10-16T13:16:27.000Z', 46, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad22252d802d44ebdaf5abc', '6a56e5c71c9080c7cb3aae57', 'D 10:10 - 20 - Ubots - Inad AD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-16T13:10:42.000Z', '2026-10-16T13:10:50.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad22127d802d44ebdae3ab3', '6a56e396408dff01d5f079f9', 'D 10:05 - 20 - Ubots - Cotas Pendentes', 'Roberty20(PRD)', '177.129.79.254', '2026-10-16T13:05:42.000Z', '2026-10-16T13:05:55.000Z', 13, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad100d6d802d44ebdff18c0', '6a4e92f4e0a326cd91fb86d5', '40 - Reclassificação Risco - CRL 3039', 'Roberty40(PRD)', '177.129.79.254', '2026-10-15T16:35:34.000Z', '2026-10-15T16:44:05.000Z', 511, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad0e001d802d44ebde7fcd7', '6a50fe0d55f7991ca7e31baa', 'D 11:15 - 20 - Relatorio Publico', 'Roberty20(PRD)', '177.129.79.254', '2026-10-15T14:15:29.000Z', '2026-10-15T14:16:34.000Z', 65, false, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad0d574d802d44ebddfb24b', '6a56e6431c9080c7cb3aae8a', 'D 10:30 - 20 - Ubots - Inad Credito 35 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-15T13:30:28.000Z', '2026-10-15T13:41:18.000Z', 650, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad0d448d802d44ebddea99f', '6a56e61c1c9080c7cb3aae79', 'D 10:25 - 20 - Ubots - Inad Credito 25 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-15T13:25:27.000Z', '2026-10-15T13:25:42.000Z', 15, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad0d31cd802d44ebdddc9fc', '6a56e5f81c9080c7cb3aae68', 'D 10:20 - 20 -Ubots -  Inad Credito 03 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-15T13:20:28.000Z', '2026-10-15T13:20:42.000Z', 14, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad0d1f0d802d44ebddcc4ca', '6a56e5881c9080c7cb3aae46', 'D 10:15 - 20 - Ubots - Inad TD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-15T13:15:27.000Z', '2026-10-15T13:18:24.000Z', 177, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad0d0c4d802d44ebddbc1df', '6a56e5c71c9080c7cb3aae57', 'D 10:10 - 20 - Ubots - Inad AD 05 dias', 'Roberty20(PRD)', '177.129.79.254', '2026-10-15T13:10:28.000Z', '2026-10-15T13:10:36.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ad0cf98d802d44ebddaccb9', '6a56e396408dff01d5f079f9', 'D 10:05 - 20 - Ubots - Cotas Pendentes', 'Roberty20(PRD)', '177.129.79.254', '2026-10-15T13:05:28.000Z', '2026-10-15T13:05:39.000Z', 11, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6acf93e1d802d44ebd0fb18d', '6a848e2863313f843eb316ed', 'S 11:30 - 20 - Ubots - Cancelamento Seguros - Qua', 'Roberty20(PRD)', '177.129.79.254', '2026-10-14T14:38:24.000Z', '2026-10-14T14:39:05.000Z', 41, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ac6592502e3682a087e4ea8', '6a848e2863313f843eb316ed', 'S 11:30 - 20 - Ubots - Cancelamento Seguros - Qua', 'Roberty20(PRD)', '177.129.79.254', '2026-10-07T14:37:24.000Z', '2026-10-07T14:38:01.000Z', 37, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6abd1d7702e3682a08b801b2', '6a848e2863313f843eb316ed', 'S 11:30 - 20 - Ubots - Cancelamento Seguros - Qua', 'Roberty20(PRD)', '177.129.79.254', '2026-09-30T14:32:24.000Z', '2026-09-30T14:33:03.000Z', 39, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ab535d3dba966018e6e5f42', '6a848e2863313f843eb316ed', 'S 11:30 - 20 - Ubots - Cancelamento Seguros - Qua', 'Roberty20(PRD)', '177.129.79.254', '2026-09-24T14:38:09.000Z', '2026-09-24T14:38:56.000Z', 47, true, 'MANUAL')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6ab3e303dba966018e6df53c', '6a848e2863313f843eb316ed', 'S 11:30 - 20 - Ubots - Cancelamento Seguros - Qua', 'Roberty20(PRD)', '177.129.79.254', '2026-09-23T14:32:35.000Z', '2026-09-23T14:32:41.000Z', 6, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6aaaa878dba966018e9ac852', '6a848e2863313f843eb316ed', 'S 11:30 - 20 - Ubots - Cancelamento Seguros - Qua', 'Roberty20(PRD)', '177.129.79.254', '2026-09-16T14:32:23.000Z', '2026-09-16T14:32:34.000Z', 11, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6aa16d9d6b15e82c5ba4655c', '6a848e2863313f843eb316ed', 'S 11:30 - 20 - Ubots - Cancelamento Seguros - Qua', 'Roberty20(PRD)', '177.129.79.254', '2026-09-09T14:30:53.000Z', '2026-09-09T14:31:01.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;
INSERT INTO roberty_runs (run_id, robot_id, robot_name, device_name, public_ip, start_date, end_date, duration_seconds, success, trigger_kind)
VALUES ('6a98330db490ba664a35e265', '6a848e2863313f843eb316ed', 'S 11:30 - 20 - Ubots - Cancelamento Seguros - Qua', 'Roberty20(PRD)', '177.129.79.254', '2026-09-02T14:30:36.000Z', '2026-09-02T14:30:44.000Z', 8, true, 'SCHEDULED')
ON CONFLICT (run_id) DO NOTHING;

-- 3. AGENDAMENTOS (SCHEDULES)
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6a2c6e98ed19bb6e2824de5c', '40 - Abrir e Fechar Bloco de Notas', 'Roberty40(PRD)', 'weekly', '0,1,2,3,4,5,6', '', '10m', 27, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6a95bc8cf76e680289729ffa', '20 - BNDES Enquadramento Novo', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '08:14 as 17:15', '15m', 51, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6a734eb34541874c6835fb91', '20 - BNDES Vinculação Novo', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '08:15 as 17:15', '15m', 101, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ac92672c683057d7c780f85', '01 - Aprovações Conta Capital', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '09:00 as 17:00', '15m', 127, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6a95bcf68dbc09c3c9da2cfe', '20 - BNDES - Acompanhamento', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '08:30 as 17:30', '30m', 22, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6aa1c47b1387463b3299414d', '20 - Seguros Sigas', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '', 'N/A', 130, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ac932151e05357c26de5cba', '01 - Relatório 7045', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 153, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ad9fbfb0cecffdf68586ed8', '01 - Relatório Estornos Débito Automático', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 88, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ace368eba88ae2d797202a1', '01 - Relatório Simulações de Crédito', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 202, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ac9387b6b800fe6e3096a48', '01 - Relatório Fabrica de Limites', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 156, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ace47eb38ad0ed93cff6b6c', '01 - Relatórios Risco', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 475, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6aaa6bad0dbed1915d8a60ad', '20 - Download de convênios', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '', 'N/A', 55, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ace04c726987de16c420337', '01 - Importacao Dados LCA', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 92, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ace051726987de16c420346', '01 - Importacao Dados LCI', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 238, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ace047126987de16c420321', '01 - Importacao Aplicacoes LCI LCA', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 105, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ad9fb890cecffdf68586ec8', '01 - Relatório Câmbio', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 30, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ae22ce402e600b389b899aa', '20 - 09:10 Inad Consclic', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '', 'N/A', 0, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6a57a43904dbed914d813b96', 'D 10:05 - 20 - Ubots - Cotas Pendentes', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '', 'N/A', 13, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6a5a281074e9d96a44fc452c', 'D 10:10 - 20 - Ubots - Inad AD 05 dias', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '', 'N/A', 147, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6a592cf97d68dec2456cebe7', 'D 10:15 - 20 - Ubots - Inad TD 05 dias', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '', 'N/A', 78, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6a5c2ea804534ad6bf283059', 'D 10:20 - 20 -Ubots -  Inad Credito 03 dias', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '', 'N/A', 405, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6a5c357078e2d1099e41a0c0', 'D 10:25 - 20 - Ubots - Inad Credito 25 dias', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '', 'N/A', 115, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6a5c36f255cb394d6f93cb4f', 'D 10:30 - 20 - Ubots - Inad Credito 35 dias', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '', 'N/A', 142, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ae20315c90eaacd57cfccbf', 'D 11:20 - 20 - Relatorio Etica e Integridade', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 65, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ae202aac90eaacd57cfcc9f', 'D 11:35 20 - Relatorio Consorcio', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 138, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ae201e2c90eaacd57cfcc70', 'D 11:00 - 20 - Relatórios Embaixador Sicoob', 'Roberty(UAD01)', 'weekly', '1,2,3,4,5', '', 'N/A', 40, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6ae0f1363ee06e2883440c4c', 'Roberty - Carteira de Credito - Baixa de Saldos e Liberacoes BRDE', 'Roberty20(PRD)', 'weekly', '1,2,3,4,5', '', 'N/A', 0, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();
INSERT INTO roberty_schedules (schedule_id, robot_name, device_name, schedule_mode, week_days, time_window, time_interval, average_duration_seconds, updated_at)
VALUES ('6a57cc700016f95a3332ff12', 'S  14:00 - 20 - Ubots -  Encerramento Conta - Quinta', 'Roberty20(PRD)', 'weekly', '4', '', 'N/A', 96, NOW())
ON CONFLICT (schedule_id) DO UPDATE SET time_window = EXCLUDED.time_window, time_interval = EXCLUDED.time_interval, updated_at = NOW();