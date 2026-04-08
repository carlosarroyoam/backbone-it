-- WISP Management System Seed Data

USE `backbone-ti`;

INSERT INTO customers (id, first_name, last_name, phone_number, email, password_hash, status, balance) VALUES
(1, 'José', 'García', '6181234567', 'jose.garcia@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'active', 150.00),
(2, 'María', 'López', '6182345678', 'maria.lopez@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'active', 200.50),
(3, 'Carlos', 'Martínez', '6183456789', 'carlos.martinez@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'active', 75.00),
(4, 'Ana', 'González', '6184567890', 'ana.gonzalez@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'active', 300.00),
(5, 'Juan', 'Hernández', '6185678901', 'juan.hernandez@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'active', 125.00),
(6, 'Laura', 'Ramírez', '6186789012', 'laura.ramirez@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'suspended', 0.00),
(7, 'Rodrigo', 'Torres', '6187890123', 'rodrigo.torres@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'active', 450.00),
(8, 'Sofía', 'Flores', '6188901234', 'sofia.flores@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'active', 180.00),
(9, 'Miguel', 'Aguilar', '6189012345', 'miguel.aguilar@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'active', 95.00),
(10, 'Elena', 'Morales', '6180123456', 'elena.morales@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'active', 220.00),
(11, 'Antonio', 'Rojas', '6181112222', 'antonio.rojas@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'active', 175.00),
(12, 'Karina', 'Navarro', '6183334444', 'karina.navarro@example.com', '$2b$10$xVfYjKn0kPQZ8K5kPQZ8KOqZ8K5kPQZ8K5kPQZ8K5kPQZ8K5kPQZ', 'active', 310.00);

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
(1, 'Torre Durango Centro', 'TWR-DGO-001', 'Av. Tecnológico s/n, Durango, Durango', 24.0277, -104.6534, 'active'),
(2, 'Torre Gómez Palacio', 'TWR-GPA-001', 'Blvd. Los Rosales, Gómez Palacio, Durango', 25.5628, -103.4945, 'active'),
(3, 'Torre Mazatlán', 'TWR-MAZ-001', 'Av. del Mar, Mazatlán, Sinaloa', 23.2494, -106.4111, 'active'),
(4, 'Torre Torreón', 'TWR-TRN-001', 'Blvd. Independencia, Torreón, Coahuila', 25.5428, -103.4065, 'active'),
(5, 'Torre Monterrey', 'TWR-MTY-001', 'Av. Garza Sada, Monterrey, Nuevo León', 25.6866, -100.3161, 'maintenance'),
(6, 'Torre Puebla', 'TWR-PUE-001', 'Av. 15 de Mayo, Puebla, Puebla', 19.0414, -98.2063, 'active');

INSERT INTO sectors (id, tower_id, name, sector_number, azimuth, angle_width, frequency_band, channel_width, tx_power, status) VALUES
(1, 1, 'Sector Norte', 1, 0, 60, '5GHz', 80, 27, 'active'),
(2, 1, 'Sector Este', 2, 90, 60, '5GHz', 80, 27, 'active'),
(3, 1, 'Sector Sur', 3, 180, 60, '5GHz', 80, 27, 'active'),
(4, 1, 'Sector Oeste', 4, 270, 60, '5GHz', 80, 27, 'active'),
(5, 2, 'Sector Principal', 1, 0, 120, '5GHz', 40, 25, 'active'),
(6, 2, 'Sector Secundario', 2, 180, 120, '5GHz', 40, 25, 'active'),
(7, 3, 'Sector Playa', 1, 90, 90, '5GHz', 80, 27, 'active'),
(8, 3, 'Sector Marina', 2, 270, 90, '5GHz', 80, 27, 'active'),
(9, 4, 'Sector Norte', 1, 0, 60, '5GHz', 80, 27, 'active'),
(10, 4, 'Sector Sur', 2, 180, 60, '5GHz', 80, 27, 'active'),
(11, 5, 'Sector Centro', 1, 0, 120, '5GHz', 40, 23, 'maintenance'),
(12, 6, 'Sector 1', 1, 0, 60, '5GHz', 80, 27, 'active'),
(13, 6, 'Sector 2', 2, 120, 60, '5GHz', 80, 27, 'active'),
(14, 6, 'Sector 3', 3, 240, 60, '5GHz', 80, 27, 'active');

INSERT INTO network_devices (id, mac_address, device_type, vendor, model, serial_number, firmware_version, ip_address, sector_id, customer_id, status) VALUES
(1, '00:11:22:33:44:55', 'ap', 'Ubiquiti', 'AirFiber 60GHz', 'AF-60-GH-12345', 'v3.0.1', '10.0.1.1', 1, NULL, 'online'),
(2, '00:11:22:33:44:56', 'ap', 'Ubiquiti', 'AirFiber 60GHz', 'AF-60-GH-12346', 'v3.0.1', '10.0.1.2', 2, NULL, 'online'),
(3, '00:11:22:33:44:57', 'ap', 'Ubiquiti', 'Rocket 5AC', 'R5AC-12347', 'v2.6.5', '10.0.1.3', 3, NULL, 'online'),
(4, '00:11:22:33:44:58', 'ap', 'Ubiquiti', 'Rocket 5AC', 'R5AC-12348', 'v2.6.5', '10.0.1.4', 4, NULL, 'online'),
(5, '00:11:22:33:44:59', 'ap', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12349', 'v2.0.5', '10.0.2.1', 5, NULL, 'online'),
(6, '00:11:22:33:44:5A', 'ap', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12350', 'v2.0.5', '10.0.2.2', 6, NULL, 'online'),
(7, '00:11:22:33:44:5B', 'cpe', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12351', 'v2.6.5', '10.10.1.1', 7, 1, 'provisioned'),
(8, '00:11:22:33:44:5C', 'cpe', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12352', 'v2.6.5', '10.10.1.2', 8, 2, 'provisioned'),
(9, '00:11:22:33:44:5D', 'cpe', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12353', 'v2.6.5', '10.10.1.3', 9, 3, 'provisioned'),
(10, '00:11:22:33:44:5E', 'cpe', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12354', 'v2.6.5', '10.10.1.4', 10, 4, 'provisioned'),
(11, '00:11:22:33:44:5F', 'cpe', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12355', 'v2.0.5', '10.10.1.5', 7, 5, 'provisioned'),
(12, '00:11:22:33:44:60', 'cpe', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12356', 'v2.0.5', '10.10.1.6', 12, 6, 'offline'),
(13, '00:11:22:33:44:61', 'cpe', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12357', 'v2.6.5', '10.10.1.7', 13, 7, 'provisioned'),
(14, '00:11:22:33:44:62', 'cpe', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12358', 'v2.6.5', '10.10.1.8', 14, 8, 'provisioned'),
(15, '00:11:22:33:44:63', 'cpe', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12359', 'v2.0.5', '10.10.1.9', 9, 9, 'provisioned'),
(16, '00:11:22:33:44:64', 'cpe', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12360', 'v2.6.5', '10.10.1.10', 10, 10, 'provisioned'),
(17, '00:11:22:33:44:65', 'cpe', 'Ubiquiti', 'NanoStation 5AC', 'NS-5AC-12361', 'v2.6.5', '10.10.1.11', 12, 11, 'provisioned'),
(18, '00:11:22:33:44:66', 'cpe', 'Ubiquiti', 'LiteBeam 5AC', 'LBE-5AC-12362', 'v2.0.5', '10.10.1.12', 13, 12, 'provisioned'),
(19, '00:11:22:33:44:67', 'router', 'MikroTik', 'CCR-1009-7G', 'CCR-12363', 'v7.13.5', '10.0.0.1', NULL, NULL, 'online'),
(20, '00:11:22:33:44:68', 'switch', 'Ubiquiti', 'EdgeSwitch 24', 'ES-24-12364', 'v2.0.6', '10.0.0.2', NULL, NULL, 'online');

INSERT INTO service_plans (id, name, code, description, download_speed_mbps, upload_speed_mbps, price, billing_cycle) VALUES
(1, 'Básico 10 Mbps', 'BASIC-10', 'Plan básico para navegación y correo electrónico', 10, 5, 199.00, 'monthly'),
(2, 'Hogar 20 Mbps', 'HOME-20', 'Plan ideal para hogar con múltiples dispositivos', 20, 10, 299.00, 'monthly'),
(3, 'Hogar 50 Mbps', 'HOME-50', 'Plan premium para streaming y gaming', 50, 25, 449.00, 'monthly'),
(4, 'Negocios 30 Mbps', 'BIZ-30', 'Plan para negocios pequeños', 30, 15, 399.00, 'monthly'),
(5, 'Negocios 100 Mbps', 'BIZ-100', 'Plan empresarial de alta velocidad', 100, 50, 799.00, 'monthly'),
(6, 'Gigabit', 'GIG-1000', 'Plan ultra de máxima velocidad', 1000, 500, 1299.00, 'monthly'),
(7, 'Prepagado 5 Días', 'PREPAID-5D', 'Plan prepagado válido 5 días', 10, 5, 50.00, 'monthly');

INSERT INTO subscriptions (id, customer_id, plan_id, device_id, username, password, pppoe_ip_address, static_ip_address, status, activated_at) VALUES
(1, 1, 2, 7, 'jose.garcia', 'ppp123456', '10.20.1.1', NULL, 'active', '2024-01-15 10:00:00'),
(2, 2, 3, 8, 'maria.lopez', 'ppp234567', '10.20.1.2', NULL, 'active', '2024-02-01 14:30:00'),
(3, 3, 1, 9, 'carlos.martinez', 'ppp345678', '10.20.1.3', NULL, 'active', '2024-02-10 09:15:00'),
(4, 4, 3, 10, 'ana.gonzalez', 'ppp456789', '10.20.1.4', NULL, 'active', '2024-03-05 11:00:00'),
(5, 5, 2, 11, 'juan.hernandez', 'ppp567890', '10.20.1.5', NULL, 'active', '2024-03-12 16:45:00'),
(6, 6, 1, 12, 'laura.ramirez', 'ppp678901', '10.20.1.6', NULL, 'suspended', '2024-01-20 08:00:00'),
(7, 7, 4, 13, 'rodrigo.torres', 'ppp789012', '10.20.1.7', '192.168.100.10', 'active', '2024-04-01 10:00:00'),
(8, 8, 2, 14, 'sofia.flores', 'ppp890123', '10.20.1.8', NULL, 'active', '2024-04-15 13:20:00'),
(9, 9, 1, 15, 'miguel.aguilar', 'ppp901234', '10.20.1.9', NULL, 'active', '2024-05-01 09:30:00'),
(10, 10, 2, 16, 'elena.morales', 'ppp012345', '10.20.1.10', NULL, 'active', '2024-05-10 15:00:00'),
(11, 11, 5, 17, 'antonio.rojas', 'ppp112233', '10.20.1.11', '192.168.100.11', 'active', '2024-06-01 10:00:00'),
(12, 12, 3, 18, 'karina.navarro', 'ppp223344', '10.20.1.12', NULL, 'active', '2024-06-15 14:00:00');

INSERT INTO transactions (id, customer_id, type, amount, payment_method, reference, description) VALUES
(1, 1, 'topup', 300.00, 'bank_transfer', 'DEP-001', 'Depósito bancario inicial'),
(2, 1, 'payment', -199.00, 'gateway', 'PAY-001', 'Pago plan mensual'),
(3, 2, 'topup', 500.00, 'cash', 'EFE-001', 'Pago en efectivo'),
(4, 2, 'payment', -299.00, 'gateway', 'PAY-002', 'Pago plan mensual'),
(5, 3, 'topup', 200.00, 'bank_transfer', 'DEP-002', 'Depósito bancario'),
(6, 3, 'payment', -125.00, 'gateway', 'PAY-003', 'Pago plan mensual'),
(7, 4, 'topup', 600.00, 'credit_card', 'TAR-001', 'Pago con tarjeta'),
(8, 4, 'payment', -300.00, 'gateway', 'PAY-004', 'Pago plan mensual'),
(9, 5, 'topup', 250.00, 'bank_transfer', 'DEP-003', 'Depósito bancario'),
(10, 5, 'payment', -125.00, 'gateway', 'PAY-005', 'Pago plan mensual'),
(11, 7, 'topup', 1000.00, 'bank_transfer', 'DEP-004', 'Depósito bancario plan negocio'),
(12, 7, 'payment', -399.00, 'gateway', 'PAY-006', 'Pago plan mensual'),
(13, 8, 'topup', 400.00, 'cash', 'EFE-002', 'Pago en efectivo'),
(14, 8, 'payment', -220.00, 'gateway', 'PAY-007', 'Pago plan mensual'),
(15, 9, 'topup', 150.00, 'bank_transfer', 'DEP-005', 'Depósito bancario'),
(16, 10, 'topup', 450.00, 'credit_card', 'TAR-002', 'Pago con tarjeta'),
(17, 10, 'payment', -230.00, 'gateway', 'PAY-008', 'Pago plan mensual'),
(18, 11, 'topup', 500.00, 'bank_transfer', 'DEP-006', 'Depósito bancario'),
(19, 11, 'payment', -325.00, 'gateway', 'PAY-009', 'Pago plan mensual'),
(20, 12, 'topup', 600.00, 'bank_transfer', 'DEP-007', 'Depósito bancario'),
(21, 12, 'payment', -380.00, 'gateway', 'PAY-010', 'Pago plan mensual');

INSERT INTO tickets (id, ticket_number, customer_id, category, priority, subject, description, status, created_at) VALUES
(1, 'TKT-001', 3, 'technical', 'high', 'Conexión lenta', 'Experimento velocidades muy bajas desde hace 2 días', 'open', '2024-06-01 10:00:00'),
(2, 'TKT-002', 5, 'billing', 'medium', 'Factura incorrecta', 'Me chargaron doble este mes', 'in_progress', '2024-06-02 14:30:00'),
(3, 'TKT-003', 8, 'technical', 'urgent', 'Sin conexión', 'No tengo internet desde ayer', 'open', '2024-06-10 08:00:00'),
(4, 'TKT-004', 2, 'account', 'low', 'Cambio de datos', 'Necesito actualizar mi dirección', 'pending', '2024-06-05 11:00:00'),
(5, 'TKT-005', 11, 'technical', 'medium', 'IP estática no funciona', 'Solicité IP estática y no me funciona', 'resolved', '2024-05-20 09:00:00'),
(6, 'TKT-006', 6, 'billing', 'high', 'Suspensión indebida', 'Me suspendieron pero ya pagué', 'closed', '2024-04-15 16:00:00');

INSERT INTO ticket_messages (id, ticket_id, user_type, user_id, message) VALUES
(1, 1, 'customer', 3, 'Experimento velocidades muy bajas desde hace 2 días, me marca 1 Mbps cuando debería ser 20'),
(2, 1, 'staff', 1, 'Gracias por reportar, vamos a revisar la línea. ¿Puede reiniciar su equipo?'),
(3, 2, 'customer', 5, 'Me chargaron doble este mes, necesito que me regresen el cargo'),
(4, 2, 'staff', 1, 'Estamos revisando el historial de pagos. Le confirmamos en breve.'),
(5, 3, 'customer', 8, 'No tengo internet desde ayer, necesito ayuda urgente'),
(6, 3, 'staff', 1, 'Estamos verificando el estado de su conexión. Favor de esperar.'),
(7, 4, 'customer', 2, 'Me mudé de dirección, necesito actualizar mis datos para la facturación'),
(8, 5, 'customer', 11, 'Solicité IP estática y no me funciona, me sigue dando IP dinámica'),
(9, 5, 'staff', 1, 'El problema era de configuración, ya fue resuelto. ¿Confirmas que funciona?'),
(10, 6, 'customer', 6, 'Me suspendieron el servicio pero ya hice el pago ayer'),
(11, 6, 'staff', 1, 'El pago no se había acreditado. Ya se acreditó y restauramos su servicio.');

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
