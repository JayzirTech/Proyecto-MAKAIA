-- ===================================================
-- PROYECTO: GESTION DE APUESTAS EN LINEA (DML SEED DATA)
-- Archivo: /scripts/02_dml_seed_data.sql
-- ===================================================

-- 1. DEPORTES
INSERT INTO dim_sports (name) VALUES 
('Fútbol'),
('Baloncesto'),
('Tenis');

-- 2. LIGAS
INSERT INTO dim_leagues (id_sport, name, country) VALUES 
(1, 'Liga BetPlay', 'Colombia'),
(1, 'UEFA Champions League', 'Europa'),
(2, 'NBA', 'Estados Unidos');

-- 3. EQUIPOS
INSERT INTO dim_teams (name) VALUES 
('Junior de Barranquilla'),
('Atlético Nacional'),
('Real Madrid'),
('FC Barcelona'),
('Los Angeles Lakers'),
('Boston Celtics');

-- 4. RELACIÓN EQUIPOS - LIGAS (Tabla Pivote rel_team_leagues)
INSERT INTO rel_team_leagues (id_team, id_league) VALUES 
(1, 1), -- Junior -> Liga BetPlay
(2, 1), -- Nacional -> Liga BetPlay
(3, 2), -- Real Madrid -> Champions League
(4, 2), -- FC Barcelona -> Champions League
(5, 3), -- Lakers -> NBA
(6, 3); -- Celtics -> NBA

-- 5. USUARIOS (Con variaciones de KYC y saldos)
INSERT INTO dim_users (first_name, last_name, email, phone_number, date_of_birth, kyc_status, account_balance, created_at) VALUES 
('Carlos', 'Mendoza', 'carlos.mendoza@email.com', '+573001234567', '1995-04-12', 'Verified', 150000.00, '2026-08-01 10:00:00'),
('Ana', 'Gomez', 'ana.gomez@email.com', '+573109876543', '1998-08-25', 'Pending', 0.00, '2026-08-15 14:30:00'),
('Luis', 'Martinez', 'luis.martinez@email.com', '+573205558899', '1990-11-03', 'Verified', 50000.00, '2026-09-01 09:15:00');

-- 6. CATÁLOGO DE MÉTODOS DE PAGO (Catálogo Global Estático)
INSERT INTO dim_payment_methods (name, provider_name, is_active) VALUES 
('E-Wallet', 'Nequi', TRUE),
('Credit Card', 'Visa / Mastercard (PayU)', TRUE),
('Bank Transfer', 'PSE (Davivienda)', TRUE);

-- 7. EVENTOS DEPORTIVOS
INSERT INTO dim_sports_events (id_league, id_home_team, id_away_team, event_date, status, final_result) VALUES 
(1, 1, 2, '2026-10-10 18:00:00', 'Scheduled', NULL),           -- Junior vs Nacional
(2, 3, 4, '2026-10-15 14:00:00', 'Scheduled', NULL),           -- Real Madrid vs Barcelona
(3, 5, 6, '2026-09-01 20:00:00', 'Finished', '108-102');        -- Lakers vs Celtics (Finalizado)

-- 8. MERCADOS DE APUESTA
INSERT INTO dim_bet_markets (id_event, market_name, status) VALUES 
(1, 'Ganador del Partido (1X2)', 'Open'),
(1, 'Total Goles Over/Under 2.5', 'Open'),
(2, 'Ganador del Partido (1X2)', 'Open');

-- 9. SEGUIMIENTO E HISTORIAL DE CUOTAS (ODDS)
INSERT INTO fact_odds_history (id_market, selection_option, odd_value, changed_at) VALUES 
-- Mercado 1: Junior vs Nacional (1X2) - Apertura de cuotas (IDs 1, 2, 3)
(1, 'Gana Junior (1)', 2.20, '2026-10-01 08:00:00'),
(1, 'Empate (X)', 3.10, '2026-10-01 08:00:00'),
(1, 'Gana Nacional (2)', 3.40, '2026-10-01 08:00:00'),
-- Mercado 1: Ajuste de cuota en el tiempo (Subió/Bajó la cuota de Junior - ID 4)
(1, 'Gana Junior (1)', 2.10, '2026-10-05 10:30:00'),
-- Mercado 2: Total Goles (IDs 5, 6)
(2, 'Over 2.5 Goles', 1.95, '2026-10-01 08:00:00'),
(2, 'Under 2.5 Goles', 1.85, '2026-10-01 08:00:00'),
-- Mercado 3: El Clásico (IDs 7, 8, 9)
(3, 'Gana Real Madrid (1)', 2.05, '2026-10-02 09:00:00'),
(3, 'Empate (X)', 3.50, '2026-10-02 09:00:00'),
(3, 'Gana FC Barcelona (2)', 3.20, '2026-10-02 09:00:00');

-- 10. TRANSACCIONES FINANCIERAS
INSERT INTO fact_financial_transactions (transaction_reference, id_user, id_payment_method, transaction_type, amount, transaction_datetime, status) VALUES 
('TX-9876543210-UUID-01', 1, 1, 'Deposit', 170000.00, '2026-10-05 11:00:00', 'Completed'),
('TX-9876543210-UUID-02', 3, 3, 'Deposit', 50000.00, '2026-10-05 12:15:00', 'Completed');

-- 11. APUESTAS (TICKETS Y SELECCIONES)
-- Ticket 1: Apuesta Simple de Carlos Mendoza (20,000 a la cuota congelada 2.10)
INSERT INTO fact_bet_tickets (id_user, total_stake, potential_payout, ticket_status, placed_at) VALUES 
(1, 20000.00, 42000.00, 'Pending', '2026-10-05 14:00:00');

INSERT INTO fact_bet_selections (id_ticket, id_odd, selected_option, odd_value_at_bet, status) VALUES 
(1, 4, 'Gana Junior (1)', 2.10, 'Pending');

-- Ticket 2: Apuesta Combinada / Parlay de Luis Martinez (10,000 apostados)
INSERT INTO fact_bet_tickets (id_user, total_stake, potential_payout, ticket_status, placed_at) VALUES 
(3, 10000.00, 40950.00, 'Pending', '2026-10-06 09:30:00');

INSERT INTO fact_bet_selections (id_ticket, id_odd, selected_option, odd_value_at_bet, status) VALUES 
(2, 4, 'Gana Junior (1)', 2.10, 'Pending'),
(2, 5, 'Over 2.5 Goles', 1.95, 'Pending');