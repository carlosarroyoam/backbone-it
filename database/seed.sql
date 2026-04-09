-- WISP Management System Seed Data

USE `backbone-ti`;

INSERT INTO customers (id, first_name, last_name, phone_number, email, password_hash, status, balance) VALUES
(1, 'José', 'García', '6181234567', 'jose.garcia@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'ACTIVE', 150.00),
(2, 'María', 'López', '6182345678', 'maria.lopez@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'ACTIVE', 200.50),
(3, 'Carlos', 'Martínez', '6183456789', 'carlos.martinez@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'ACTIVE', 75.00),
(4, 'Ana', 'González', '6184567890', 'ana.gonzalez@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'ACTIVE', 300.00),
(5, 'Juan', 'Hernández', '6185678901', 'juan.hernandez@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'ACTIVE', 125.00),
(6, 'Laura', 'Ramírez', '6186789012', 'laura.ramirez@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'SUSPENDED', 0.00),
(7, 'Rodrigo', 'Torres', '6187890123', 'rodrigo.torres@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'ACTIVE', 450.00),
(8, 'Sofía', 'Flores', '6188901234', 'sofia.flores@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'ACTIVE', 180.00),
(9, 'Miguel', 'Aguilar', '6189012345', 'miguel.aguilar@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'ACTIVE', 95.00),
(10, 'Elena', 'Morales', '6180123456', 'elena.morales@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'ACTIVE', 220.00),
(11, 'Antonio', 'Rojas', '6181112222', 'antonio.rojas@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'ACTIVE', 175.00),
(12, 'Karina', 'Navarro', '6183334444', 'karina.navarro@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'ACTIVE', 310.00);

INSERT INTO customer_addresses (id, street_name, street_number, apartament_number, sublocality, locality, state, country, postal_code, customer_id) VALUES 
(1, 'Av. Tecnológico', '1234', null, 'Del Lago', 'Durango', 'Durango', 'MX', '34080', 1),
(2, 'Calle 5 de Mayo', '567', null, '	Esperanza','Durango', 'Durango', 'MX', '34000', 2),
(3, 'Blvd. Francisco Villa', '890', null, '	Nueva Vizcaya', 'Durango', 'Durango', 'MX', '34100', 3),
(4, 'Calle Juárez', '234', null, '	Del Lago', 'Durango', 'Durango', 'MX', '34050', 4),
(5, 'Av. Mazatlán', '456', null, '	Los Pinos', 'Sinaloa', 'Mazatlán', 'MX', '82000', 5),
(6, 'Calle Hidalgo', '789', null, 'Rosas del Tepeyac', 'Durango', 'Durango', 'MX', '34020', 6),
(7, 'Av. La Costa', '321', null, 'Plaza Náutica', 'Cabo San Lucas', 'Baja California Sur', 'MX', '23450', 7),
(8, 'Calle Allende', '654', null, 'Gómez Palacio Centro', 'Gómez Palacio', 'Durango', 'MX', '35000', 8),
(9, 'Blvd. Las Americas', '777', null, 'Centro', 'Torreón', 'Coahuila', 'MX', '27000', 9),
(10, 'Av. Central', '432', null, 'Torreón Centro', 'Lerdo', 'Durango', 'MX', '35150', 10),
(11, 'Calle México', '111', null, 'Monterrey Centro', 'Monterrey', 'Nuevo León', 'MX', '64000', 11),
(12, 'Av. Universidad', '555', null, 'San Francisco', 'Puebla', 'Puebla', 'MX', '72000', 12);

INSERT INTO towers (id, name, code, address, latitude, longitude, status) VALUES
(1, 'Torre Durango Centro', 'TWR-DGO-001', 'Av. Tecnológico s/n, Durango, Durango', 24.0277, -104.6534, 'ACTIVE'),
(2, 'Torre Gómez Palacio', 'TWR-GPA-001', 'Blvd. Los Rosales, Gómez Palacio, Durango', 25.5628, -103.4945, 'ACTIVE'),
(3, 'Torre Mazatlán', 'TWR-MAZ-001', 'Av. del Mar, Mazatlán, Sinaloa', 23.2494, -106.4111, 'ACTIVE'),
(4, 'Torre Torreón', 'TWR-TRN-001', 'Blvd. Independencia, Torreón, Coahuila', 25.5428, -103.4065, 'ACTIVE'),
(5, 'Torre Monterrey', 'TWR-MTY-001', 'Av. Garza Sada, Monterrey, Nuevo León', 25.6866, -100.3161, 'maintenance'),
(6, 'Torre Puebla', 'TWR-PUE-001', 'Av. 15 de Mayo, Puebla, Puebla', 19.0414, -98.2063, 'ACTIVE');

INSERT INTO sectors (id, name, sector_number, azimuth, angle_width, frequency_band, channel_width, tx_power, status, tower_id) VALUES
(1, 'Sector Norte', 1, 0, 60, '5GHz', 80, 27, 'ACTIVE', 1),
(2, 'Sector Este', 2, 90, 60, '5GHz', 80, 27, 'ACTIVE', 1),
(3, 'Sector Sur', 3, 180, 60, '5GHz', 80, 27, 'ACTIVE', 1),
(4, 'Sector Oeste', 4, 270, 60, '5GHz', 80, 27, 'ACTIVE', 1),
(5, 'Sector Principal', 1, 0, 120, '5GHz', 40, 25, 'ACTIVE', 2),
(6, 'Sector Secundario', 2, 180, 120, '5GHz', 40, 25, 'ACTIVE', 2),
(7, 'Sector Playa', 1, 90, 90, '5GHz', 80, 27, 'ACTIVE', 3),
(8, 'Sector Marina', 2, 270, 90, '5GHz', 80, 27, 'ACTIVE', 3),
(9, 'Sector Norte', 1, 0, 60, '5GHz', 80, 27, 'ACTIVE', 4),
(10, 'Sector Sur', 2, 180, 60, '5GHz', 80, 27, 'ACTIVE', 4),
(11, 'Sector Centro', 1, 0, 120, '5GHz', 40, 23, 'maintenance', 5),
(12, 'Sector 1', 1, 0, 60, '5GHz', 80, 27, 'ACTIVE', 6),
(13, 'Sector 2', 2, 120, 60, '5GHz', 80, 27, 'ACTIVE', 6),
(14, 'Sector 3', 3, 240, 60, '5GHz', 80, 27, 'ACTIVE', 6);

INSERT INTO network_devices (id, mac_address, device_type, vendor, model, serial_number, firmware_version, ip_address, status, sector_id, customer_id) VALUES
(1, '00:11:22:33:44:55', 'AP', 'Ubiquiti', 'AirFiber 60GHz', 'AF-60-GH-12345', 'v3.0.1', '10.0.1.1', 'ONLINE', 1, NULL),
(2, '00:11:22:33:44:56', 'AP', 'Ubiquiti', 'AirFiber 60GHz', 'AF-60-GH-12346', 'v3.0.1', '10.0.1.2', 'ONLINE', 2, NULL),
(3, '00:11:22:33:44:57', 'AP', 'Ubiquiti', 'Rocket 5AC', 'R5AC-12347', 'v2.6.5', '10.0.1.3', 'ONLINE', 3, NULL),
(4, '00:11:22:33:44:58', 'AP', 'Ubiquiti', 'Rocket 5AC', 'R5AC-12348', 'v2.6.5', '10.0.1.4', 'ONLINE', 4, NULL),
(5, '00:11:22:33:44:59', 'AP', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12349', 'v2.0.5', '10.0.2.1', 'ONLINE', 5, NULL),
(6, '00:11:22:33:44:5A', 'AP', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12350', 'v2.0.5', '10.0.2.2', 'ONLINE', 6, NULL),
(7, '00:11:22:33:44:5B', 'CPE', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12351', 'v2.6.5', '10.10.1.1', 'PROVISIONED', 7, 1),
(8, '00:11:22:33:44:5C', 'CPE', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12352', 'v2.6.5', '10.10.1.2', 'PROVISIONED', 8, 2),
(9, '00:11:22:33:44:5D', 'CPE', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12353', 'v2.6.5', '10.10.1.3', 'PROVISIONED', 9, 3),
(10, '00:11:22:33:44:5E', 'CPE', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12354', 'v2.6.5', '10.10.1.4', 'PROVISIONED', 10, 4),
(11, '00:11:22:33:44:5F', 'CPE', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12355', 'v2.0.5', '10.10.1.5', 'PROVISIONED', 7, 5),
(12, '00:11:22:33:44:60', 'CPE', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12356', 'v2.0.5', '10.10.1.6', 'OFFLINE', 12, 6),
(13, '00:11:22:33:44:61', 'CPE', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12357', 'v2.6.5', '10.10.1.7', 'PROVISIONED', 13, 7),
(14, '00:11:22:33:44:62', 'CPE', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12358', 'v2.6.5', '10.10.1.8', 'PROVISIONED', 14, 8),
(15, '00:11:22:33:44:63', 'CPE', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12359', 'v2.0.5', '10.10.1.9', 'PROVISIONED', 9, 9),
(16, '00:11:22:33:44:64', 'CPE', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12360', 'v2.6.5', '10.10.1.10', 'PROVISIONED', 10, 10),
(17, '00:11:22:33:44:65', 'CPE', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12361', 'v2.6.5', '10.10.1.11', 'PROVISIONED', 12, 11),
(18, '00:11:22:33:44:66', 'CPE', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12362', 'v2.0.5', '10.10.1.12', 'PROVISIONED', 13, 12),
(19, '00:11:22:33:44:67', 'ROUTER', 'MikroTik', 'CCR-1009-7G', 'CCR-12363', 'v7.13.5', '10.0.0.1', 'ONLINE', NULL, NULL),
(20, '00:11:22:33:44:68', 'SWITCH', 'Ubiquiti', 'EdgeSwitch 24', 'ES-24-12364', 'v2.0.6', '10.0.0.2', 'ONLINE', NULL, NULL);

INSERT INTO service_plans (id, name, code, description, download_speed_mbps, upload_speed_mbps, price, billing_cycle) VALUES
(1, 'Básico 10 Mbps', 'BASIC-10', 'Plan básico para navegación y correo electrónico', 10, 5, 199.00, 'MONTHLY'),
(2, 'Hogar 20 Mbps', 'HOME-20', 'Plan ideal para hogar con múltiples dispositivos', 20, 10, 299.00, 'MONTHLY'),
(3, 'Hogar 50 Mbps', 'HOME-50', 'Plan premium para streaming y gaming', 50, 25, 449.00, 'MONTHLY'),
(4, 'Negocios 30 Mbps', 'BIZ-30', 'Plan para negocios pequeños', 30, 15, 399.00, 'MONTHLY'),
(5, 'Negocios 100 Mbps', 'BIZ-100', 'Plan empresarial de alta velocidad', 100, 50, 799.00, 'MONTHLY'),
(6, 'Gigabit', 'GIG-1000', 'Plan ultra de máxima velocidad', 1000, 500, 1299.00, 'MONTHLY'),
(7, 'Prepagado 5 Días', 'PREPAID-5D', 'Plan prepagado válido 5 días', 10, 5, 50.00, 'MONTHLY');

INSERT INTO subscriptions (id, username, password, pppoe_ip_address, static_ip_address, status, customer_id, customer_address_id, plan_id, device_id, activated_at) VALUES
(1, 'jose.garcia', 'ppp123456', '10.20.1.1', NULL, 'ACTIVE', 1, 1, 2, 7, '2024-01-15 10:00:00'),
(2, 'maria.lopez', 'ppp234567', '10.20.1.2', NULL, 'ACTIVE', 2, 2, 3, 8, '2024-02-01 14:30:00'),
(3, 'carlos.martinez', 'ppp345678', '10.20.1.3', NULL, 'ACTIVE', 3, 3, 1, 9, '2024-02-10 09:15:00'),
(4, 'ana.gonzalez', 'ppp456789', '10.20.1.4', NULL, 'ACTIVE', 4, 4, 3, 10, '2024-03-05 11:00:00'),
(5, 'juan.hernandez', 'ppp567890', '10.20.1.5', NULL, 'ACTIVE', 5, 5, 2, 11, '2024-03-12 16:45:00'),
(6, 'laura.ramirez', 'ppp678901', '10.20.1.6', NULL, 'SUSPENDED', 6, 6, 1, 12, '2024-01-20 08:00:00'),
(7, 'rodrigo.torres', 'ppp789012', '10.20.1.7', '192.168.100.10', 'ACTIVE', 7, 7, 4, 13, '2024-04-01 10:00:00'),
(8, 'sofia.flores', 'ppp890123', '10.20.1.8', NULL, 'ACTIVE', 8, 8, 2, 14, '2024-04-15 13:20:00'),
(9, 'miguel.aguilar', 'ppp901234', '10.20.1.9', NULL, 'ACTIVE', 9, 9, 1, 15, '2024-05-01 09:30:00'),
(10, 'elena.morales', 'ppp012345', '10.20.1.10', NULL, 'ACTIVE', 10, 10, 2, 16, '2024-05-10 15:00:00'),
(11, 'antonio.rojas', 'ppp112233', '10.20.1.11', '192.168.100.11', 'ACTIVE', 11, 11, 5, 17, '2024-06-01 10:00:00'),
(12, 'karina.navarro', 'ppp223344', '10.20.1.12', NULL, 'ACTIVE', 12, 12, 3, 18, '2024-06-15 14:00:00');

INSERT INTO transactions (id, type, amount, payment_method, reference, description, customer_id) VALUES
(1, 'TOPUP', 300.00, 'BANK_TRANSFER', 'DEP-001', 'Depósito bancario inicial', 1),
(2, 'PAYMENT', -199.00, 'GATEWAY', 'PAY-001', 'Pago plan mensual', 1),
(3, 'TOPUP', 500.00, 'CASH', 'EFE-001', 'Pago en efectivo', 2),
(4, 'PAYMENT', -299.00, 'GATEWAY', 'PAY-002', 'Pago plan mensual', 2),
(5, 'TOPUP', 200.00, 'BANK_TRANSFER', 'DEP-002', 'Depósito bancario', 3),
(6, 'PAYMENT', -125.00, 'GATEWAY', 'PAY-003', 'Pago plan mensual', 3),
(7, 'TOPUP', 600.00, 'CREDIT_CARD', 'TAR-001', 'Pago con tarjeta', 4),
(8, 'PAYMENT', -300.00, 'GATEWAY', 'PAY-004', 'Pago plan mensual', 4),
(9, 'TOPUP', 250.00, 'BANK_TRANSFER', 'DEP-003', 'Depósito bancario', 5),
(10, 'PAYMENT', -125.00, 'GATEWAY', 'PAY-005', 'Pago plan mensual', 5),
(11, 'TOPUP', 1000.00, 'BANK_TRANSFER', 'DEP-004', 'Depósito bancario plan negocio', 7),
(12, 'PAYMENT', -399.00, 'GATEWAY', 'PAY-006', 'Pago plan mensual', 7),
(13, 'TOPUP', 400.00, 'CASH', 'EFE-002', 'Pago en efectivo', 8),
(14, 'PAYMENT', -220.00, 'GATEWAY', 'PAY-007', 'Pago plan mensual', 8),
(15, 'TOPUP', 150.00, 'BANK_TRANSFER', 'DEP-005', 'Depósito bancario', 9),
(16, 'TOPUP', 450.00, 'CREDIT_CARD', 'TAR-002', 'Pago con tarjeta', 10),
(17, 'PAYMENT', -230.00, 'GATEWAY', 'PAY-008', 'Pago plan mensual', 10),
(18, 'TOPUP', 500.00, 'BANK_TRANSFER', 'DEP-006', 'Depósito bancario', 11),
(19, 'PAYMENT', -325.00, 'GATEWAY', 'PAY-009', 'Pago plan mensual', 11),
(20, 'TOPUP', 600.00, 'BANK_TRANSFER', 'DEP-007', 'Depósito bancario', 12),
(21, 'PAYMENT', -380.00, 'GATEWAY', 'PAY-010', 'Pago plan mensual', 12);

INSERT INTO tickets (id, ticket_number, category, priority, subject, description, status, customer_id, created_at) VALUES
(1, 'TKT-001', 'technical', 'HIGH', 'Conexión lenta', 'Experimento velocidades muy bajas desde hace 2 días', 'OPEN', 3, '2024-06-01 10:00:00'),
(2, 'TKT-002', 'billing', 'MEDIUM', 'Factura incorrecta', 'Me chargaron doble este mes', 'IN_PROGRESS', 5, '2024-06-02 14:30:00'),
(3, 'TKT-003', 'technical', 'URGENT', 'Sin conexión', 'No tengo internet desde ayer', 'OPEN', 8, '2024-06-10 08:00:00'),
(4, 'TKT-004', 'account', 'LOW', 'Cambio de datos', 'Necesito actualizar mi dirección', 'PENDING', 2, '2024-06-05 11:00:00'),
(5, 'TKT-005', 'technical', 'MEDIUM', 'IP estática no funciona', 'Solicité IP estática y no me funciona', 'RESOLVED', 11, '2024-05-20 09:00:00'),
(6, 'TKT-006', 'billing', 'HIGH', 'Suspensión indebida', 'Me suspendieron pero ya pagué', 'CLOSED', 6, '2024-04-15 16:00:00');

INSERT INTO ticket_messages (id, user_type, message, ticket_id, user_id) VALUES
(1, 'CUSTOMER', 'Experimento velocidades muy bajas desde hace 2 días, me marca 1 Mbps cuando debería ser 20', 1, 3),
(2, 'STAFF', 'Gracias por reportar, vamos a revisar la línea. ¿Puede reiniciar su equipo?', 1, 1),
(3, 'CUSTOMER', 'Me chargaron doble este mes, necesito que me regresen el cargo', 2, 5),
(4, 'STAFF', 'Estamos revisando el historial de pagos. Le confirmamos en breve.', 2, 1),
(5, 'CUSTOMER', 'No tengo internet desde ayer, necesito ayuda urgente', 3, 8),
(6, 'STAFF', 'Estamos verificando el estado de su conexión. Favor de esperar.', 3, 1),
(7, 'CUSTOMER', 'Me mudé de dirección, necesito actualizar mis datos para la facturación', 4, 2),
(8, 'CUSTOMER', 'Solicité IP estática y no me funciona, me sigue dando IP dinámica', 5, 11),
(9, 'STAFF', 'El problema era de configuración, ya fue resuelto. ¿Confirmas que funciona?', 5, 1),
(10, 'CUSTOMER', 'Me suspendieron el servicio pero ya hice el pago ayer', 6, 6),
(11, 'STAFF', 'El pago no se había acreditado. Ya se acreditó y restauramos su servicio.', 6, 1);

INSERT INTO settings (id, setting_key, setting_value, description) VALUES
(1, 'company_name', 'Backbone IT', 'Nombre de la empresa'),
(2, 'company_phone', '6180000000', 'Teléfono de contacto'),
(3, 'company_email', 'soporte@backboneit.mx', 'Email de soporte'),
(4, 'tax_rate', '16', 'Tasa de IVA (%)'),
(5, 'currency', 'MXN', 'Moneda'),
(6, 'default_plan_id', '1', 'Plan por defecto para nuevos clientes'),
(7, 'grace_period_days', '5', 'Días de gracia para suspensión'),
(8, 'radius_secret', 'changeme123', 'Secret de RADIUS'),
(9, 'session_timeout_minutes', '60', 'Tiempo de expiración de sesión'),
(10, 'min_topup_amount', '50', 'Monto mínimo de recarga'),
(11, 'max_topup_amount', '5000', 'Monto máximo de recarga');
