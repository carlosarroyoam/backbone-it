-- WISP Management System MySQL Schema

CREATE DATABASE IF NOT EXISTS `backbone-ti`;

USE `backbone-ti`;

CREATE TABLE IF NOT EXISTS roles (
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    type VARCHAR(32) NOT NULL,
    description VARCHAR(256) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_roles_type (type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS users (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    email VARCHAR(64) NOT NULL,
    password_hash VARCHAR(96) NOT NULL,
    status VARCHAR(32) NOT NULL DEFAULT 'ACTIVE' CHECK(status IN ('PENDING', 'ACTIVE', 'SUSPENDED', 'DELETED')),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_users_email (email),
    INDEX idx_users_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS user_roles (
    user_id BIGINT UNSIGNED NOT NULL,
    role_id TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT fk_user_roles_user_id
        FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT fk_user_roles_role_id
        FOREIGN KEY (role_id) REFERENCES roles (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS user_refresh_tokens (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    token VARCHAR(254) NOT NULL,
    fingerprint VARCHAR(36) NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    last_used_at TIMESTAMP DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_user_refresh_tokens_token (token),
    UNIQUE KEY uk_user_refresh_tokens_user_fingerprint (user_id, fingerprint),
    CONSTRAINT fk_user_refresh_tokens_user_id
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS user_reset_password (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    token_hash VARCHAR(254) NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    expires_on TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_user_reset_password_token_hash (token_hash),
    CONSTRAINT fk_user_reset_password_user_id
        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS customers (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    status VARCHAR(32) NOT NULL DEFAULT 'ACTIVE' CHECK(status IN ('PENDING', 'ACTIVE', 'SUSPENDED', 'DELETED')),
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
    apartment_number VARCHAR(5),
    sublocality VARCHAR(45) NOT NULL,
    locality VARCHAR(45) NOT NULL,
    state VARCHAR(45) NOT NULL,
    country VARCHAR(2) NOT NULL DEFAULT 'MX',
    postal_code VARCHAR(5) NOT NULL,
    is_default TINYINT NOT NULL DEFAULT 1 CHECK(is_default IN (0, 1)),
    customer_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_customer_addresses_customer_id (customer_id),
    CONSTRAINT fk_customer_addresses_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS customer_refresh_tokens (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    token VARCHAR(254) NOT NULL,
    fingerprint VARCHAR(36) NOT NULL,
    customer_id BIGINT UNSIGNED NOT NULL,
    last_used_at TIMESTAMP DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_customer_refresh_tokens_token (token),
    UNIQUE KEY uk_customer_refresh_tokens_fingerprint (customer_id, fingerprint),
    CONSTRAINT fk_customer_refresh_tokens_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS customer_reset_password (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    token_hash VARCHAR(254) NOT NULL,
    customer_id BIGINT UNSIGNED NOT NULL,
    expires_on TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_customer_reset_password_token_hash (token_hash),
    CONSTRAINT fk_customer_reset_password_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS api_keys (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    key_hash VARCHAR(255) NOT NULL,
    status VARCHAR(32) NOT NULL DEFAULT 'ACTIVE' CHECK(status IN ('ACTIVE', 'INACTIVE')),
    customer_id BIGINT UNSIGNED NOT NULL,
    last_used_at TIMESTAMP DEFAULT NULL,
    expires_at TIMESTAMP DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_api_keys_key_hash (key_hash),
    INDEX idx_api_keys_customer_id (customer_id),
    INDEX idx_api_keys_status (status),
    CONSTRAINT fk_api_keys_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS towers (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(50) NOT NULL,
    address TEXT,
    latitude DECIMAL(10,8),
    longitude DECIMAL(11,8),
    status VARCHAR(32) NOT NULL DEFAULT 'ACTIVE' CHECK(status IN ('ACTIVE', 'INACTIVE', 'MAINTENANCE', 'DELETED')),
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
    status VARCHAR(32) NOT NULL DEFAULT 'ACTIVE' CHECK(status IN ('ACTIVE', 'INACTIVE', 'MAINTENANCE', 'DELETED')),
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
    device_type VARCHAR(32) NOT NULL CHECK(device_type IN ('CPE', 'AP', 'ROUTER', 'SWITCH', 'ONT', 'OTHER')),
    vendor VARCHAR(100),
    model VARCHAR(100),
    serial_number VARCHAR(100),
    firmware_version VARCHAR(50),
    ip_address VARCHAR(45),
    status VARCHAR(32) NOT NULL DEFAULT 'OFFLINE' CHECK(status IN ('PROVISIONED', 'ONLINE', 'OFFLINE', 'DECOMMISSIONED', 'DELETED')),
    sector_id BIGINT UNSIGNED,
    customer_id BIGINT UNSIGNED,
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
    billing_cycle VARCHAR(32) NOT NULL DEFAULT 'MONTHLY' CHECK(billing_cycle IN ('MONTHLY', 'QUARTERLY', 'YEARLY')),
    status VARCHAR(32) NOT NULL DEFAULT 'ACTIVE' CHECK(status IN ('ACTIVE', 'INACTIVE', 'DELETED')),
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
    password_hash VARCHAR(255) NOT NULL,
    pppoe_ip_address VARCHAR(45),
    static_ip_address VARCHAR(45),
    status VARCHAR(32) NOT NULL DEFAULT 'ACTIVE' CHECK(status IN ('ACTIVE', 'SUSPENDED', 'CANCELLED')),
    plan_id BIGINT UNSIGNED NOT NULL,
    device_id BIGINT UNSIGNED,
    customer_id BIGINT UNSIGNED NOT NULL,
    customer_address_id BIGINT UNSIGNED NOT NULL,
    activated_at TIMESTAMP NULL,
    suspended_at TIMESTAMP NULL,
    cancelled_at TIMESTAMP NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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

CREATE TABLE IF NOT EXISTS transactions (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    type VARCHAR(32) NOT NULL CHECK(type IN ('TOPUP', 'PAYMENT', 'REFUND', 'ADJUSTMENT')),
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(32) NOT NULL CHECK(payment_method IN ('CASH', 'CREDIT_CARD', 'DEBIT_CARD', 'BANK_TRANSFER')),
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
    status VARCHAR(32) NOT NULL DEFAULT 'DRAFT' CHECK(status IN ('DRAFT', 'SENT', 'PAID', 'OVERDUE', 'CANCELLED')),
    customer_id BIGINT UNSIGNED NOT NULL,
    subscription_id BIGINT UNSIGNED,
    paid_at TIMESTAMP NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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

CREATE TABLE IF NOT EXISTS tickets (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ticket_number VARCHAR(50) NOT NULL,
    category VARCHAR(32) NOT NULL CHECK(category IN ('TECHNICAL', 'BILLING', 'ACCOUNT', 'OTHER')),
    priority VARCHAR(32) NOT NULL DEFAULT 'MEDIUM' CHECK(priority IN ('LOW', 'MEDIUM', 'HIGH', 'URGENT')),
    subject VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    assigned_to BIGINT UNSIGNED,
    status VARCHAR(32) NOT NULL DEFAULT 'OPEN' CHECK(status IN ('OPEN', 'PENDING', 'IN_PROGRESS', 'RESOLVED', 'CLOSED')),
    customer_id BIGINT UNSIGNED NOT NULL,
    resolved_at TIMESTAMP DEFAULT NULL,
    closed_at TIMESTAMP DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_tickets_ticket_number (ticket_number),
    INDEX idx_tickets_status (status),
    INDEX idx_tickets_customer_id (customer_id),
    INDEX idx_tickets_category (category),
    INDEX idx_tickets_priority (priority),
    CONSTRAINT fk_tickets_customer_id
        FOREIGN KEY (customer_id) REFERENCES customers(id),
    CONSTRAINT fk_tickets_assigned_to
        FOREIGN KEY (assigned_to) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS ticket_messages (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_type VARCHAR(32) NOT NULL,
    message TEXT NOT NULL,
    ticket_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_ticket_messages_ticket_id (ticket_id),
    INDEX idx_ticket_messages_user_type (user_type),
    CONSTRAINT fk_ticket_messages_ticket_id
        FOREIGN KEY (ticket_id) REFERENCES tickets(id) ON DELETE CASCADE,
    CONSTRAINT fk_ticket_messages_user_id
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS network_logs (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    event_type VARCHAR(32),
    message TEXT,
    severity VARCHAR(32) NOT NULL DEFAULT 'INFO' CHECK(severity IN ('INFO', 'WARN', 'ERROR')),
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
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_settings_setting_key (setting_key),
    INDEX idx_settings_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
