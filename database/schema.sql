-- WISP Management System MySQL Schema

CREATE DATABASE IF NOT EXISTS `backbone-ti`;

USE `backbone-ti`;

CREATE TABLE IF NOT EXISTS customers (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    balance DECIMAL(10,2) DEFAULT 0.00,
    status VARCHAR(32) DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_customers_email (email),
    UNIQUE KEY uk_customers_phone_number (phone_number),
    INDEX idx_customers_status (status),
    INDEX idx_customers_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS customer_addresses (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    street_name VARCHAR(64) NOT NULL,
    street_number VARCHAR(5) NOT NULL,
    apartament_number VARCHAR(5),
    sublocality VARCHAR(45) NOT NULL,
    locality VARCHAR(45) NOT NULL,
    state VARCHAR(45) NOT NULL,
    country VARCHAR(2) DEFAULT 'MX',
    postal_code VARCHAR(5) NOT NULL,
    customer_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    INDEX idx_customer_addresses_customer_id (customer_id),
    CONSTRAINT fk_customer_addresses_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS towers (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(50) NOT NULL,
    address TEXT,
    latitude DECIMAL(10,8),
    longitude DECIMAL(11,8),
    status VARCHAR(32) DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_towers_code (code),
    INDEX idx_towers_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS sectors (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    tower_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(100) NOT NULL,
    sector_number TINYINT UNSIGNED NOT NULL,
    azimuth INT UNSIGNED DEFAULT 0,
    angle_width INT UNSIGNED DEFAULT 60,
    frequency_band VARCHAR(20),
    channel_width INT UNSIGNED,
    tx_power INT UNSIGNED,
    status VARCHAR(32) DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_sectors_tower_sector (tower_id, sector_number),
    INDEX idx_sectors_status (status),
    INDEX idx_sectors_tower_id (tower_id),
    CONSTRAINT fk_sectors_tower_id
        FOREIGN KEY (tower_id) REFERENCES towers(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS network_devices (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    mac_address VARCHAR(17) NOT NULL,
    device_type VARCHAR(32) NOT NULL,
    vendor VARCHAR(100),
    model VARCHAR(100),
    serial_number VARCHAR(100),
    firmware_version VARCHAR(50),
    ip_address VARCHAR(45),
    sector_id BIGINT UNSIGNED,
    customer_id BIGINT UNSIGNED,
    status VARCHAR(32) DEFAULT 'OFFLINE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id),
    INDEX idx_network_devices_mac_address (mac_address),
    INDEX idx_network_devices_device_type (device_type),
    INDEX idx_network_devices_serial_number (serial_number),
    INDEX idx_network_devices_status (status),
    INDEX idx_network_devices_sector_id (sector_id),
    INDEX idx_network_devices_customer_id (customer_id),
    CONSTRAINT fk_network_devices_sector_id
        FOREIGN KEY (sector_id) REFERENCES sectors(id) ON DELETE SET NULL,
    CONSTRAINT fk_network_devices_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS service_plans (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(50) NOT NULL,
    description TEXT,
    download_speed_mbps INT UNSIGNED,
    upload_speed_mbps INT UNSIGNED,
    price DECIMAL(10,2) NOT NULL,
    billing_cycle VARCHAR(32) DEFAULT 'MONTHLY',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_service_plans_code (code),
    INDEX idx_service_plans_deleted_at (deleted_at),
    INDEX idx_service_plans_billing_cycle (billing_cycle)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS subscriptions (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    pppoe_ip_address VARCHAR(45),
    static_ip_address VARCHAR(45),
    status VARCHAR(32) DEFAULT 'ACTIVE',
    plan_id BIGINT UNSIGNED NOT NULL,
    device_id BIGINT UNSIGNED,
    customer_id BIGINT UNSIGNED NOT NULL,
    customer_address_id BIGINT UNSIGNED NOT NULL,
    activated_at TIMESTAMP NULL,
    suspended_at TIMESTAMP NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_subscriptions_username (username),
    INDEX idx_subscriptions_status (status),
    INDEX idx_subscriptions_plan_id (plan_id),
    INDEX idx_subscriptions_device_id (device_id),
    INDEX idx_subscriptions_customer_id (customer_id),
    CONSTRAINT fk_subscriptions_plan_id
        FOREIGN KEY (plan_id) REFERENCES service_plans(id),
    CONSTRAINT fk_subscriptions_device_id
        FOREIGN KEY (device_id) REFERENCES network_devices(id),
    CONSTRAINT fk_subscriptions_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    CONSTRAINT fk_subscriptions_customer_address_id
        FOREIGN KEY (customer_address_id) REFERENCES customer_addresses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS radius_attributes (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    subscription_id BIGINT UNSIGNED NOT NULL,
    attribute_type VARCHAR(50) NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_radius_attributes_subscription_id (subscription_id),
    CONSTRAINT fk_radius_attributes_subscription_id
        FOREIGN KEY (subscription_id) REFERENCES subscriptions(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS transactions (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    type VARCHAR(32) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(32),
    reference VARCHAR(255),
    description TEXT,
    customer_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_transactions_type (type),
    INDEX idx_transactions_customer_id (customer_id),
    INDEX idx_transactions_created_at (created_at),
    INDEX idx_transactions_payment_method (payment_method),
    CONSTRAINT fk_transactions_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS invoices (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    invoice_number VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    notes TEXT,
    due_date DATE,
    status VARCHAR(32) DEFAULT 'DRAFT',
    customer_id BIGINT UNSIGNED NOT NULL,
    subscription_id BIGINT UNSIGNED,
    paid_at TIMESTAMP NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_invoices_invoice_number (invoice_number),
    INDEX idx_invoices_status (status),
    INDEX idx_invoices_customer_id (customer_id),
    INDEX idx_invoices_subscription_id (subscription_id),
    CONSTRAINT fk_invoices_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers(id),
    CONSTRAINT fk_invoices_subscription_id
        FOREIGN KEY (subscription_id) REFERENCES subscriptions(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS api_keys (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    key_hash VARCHAR(255) NOT NULL,
    name VARCHAR(100),
    last_used_at TIMESTAMP NULL,
    expires_at TIMESTAMP NULL,
    status VARCHAR(32) DEFAULT 'ACTIVE',
    customer_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_api_keys_key_hash (key_hash),
    INDEX idx_api_keys_customer_id (customer_id),
    INDEX idx_api_keys_status (status),
    CONSTRAINT fk_api_keys_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS tickets (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ticket_number VARCHAR(50) NOT NULL,
    category VARCHAR(32) NOT NULL,
    priority VARCHAR(32) DEFAULT 'MEDIUM',
    subject VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    assigned_to INT UNSIGNED,
    status VARCHAR(32) DEFAULT 'OPEN',
    customer_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP DEFAULT NULL,
    closed_at TIMESTAMP DEFAULT NULL,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_tickets_ticket_number (ticket_number),
    INDEX idx_tickets_status (status),
    INDEX idx_tickets_customer_id (customer_id),
    INDEX idx_tickets_category (category),
    INDEX idx_tickets_priority (priority),
    CONSTRAINT fk_tickets_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS ticket_messages (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_type VARCHAR(32) NOT NULL,
    message TEXT NOT NULL,
    ticket_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_ticket_messages_ticket_id (ticket_id),
    INDEX idx_ticket_messages_user_type (user_type),
    CONSTRAINT fk_ticket_messages_ticket_id
        FOREIGN KEY (ticket_id) REFERENCES tickets(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS network_logs (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    event_type VARCHAR(32) NOT NULL,
    message TEXT,
    severity VARCHAR(32) DEFAULT 'INFO',
    device_id BIGINT UNSIGNED NOT NULL,
    logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_network_logs_event_type (event_type),
    INDEX idx_network_logs_logged_at (logged_at),
    INDEX idx_network_logs_device_id (device_id),
    INDEX idx_network_logs_severity (severity),
    CONSTRAINT fk_network_logs_device_id
        FOREIGN KEY (device_id) REFERENCES network_devices(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS settings (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    setting_key VARCHAR(100) NOT NULL,
    setting_value TEXT,
    description VARCHAR(255),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_settings_setting_key (setting_key),
    INDEX idx_settings_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;