CREATE DATABASE IF NOT EXISTS irs_data;

USE irs_data;

CREATE TABLE IF NOT EXISTS taxpayers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    state VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS returns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    taxpayer_id INT,
    year INT,
    tax_paid DECIMAL(10, 2),
    refund DECIMAL(10, 2),
    filing_type VARCHAR(50),
    FOREIGN KEY (taxpayer_id) REFERENCES taxpayers(id)
);
CREATE DATABASE IF NOT EXISTS irs_data;

USE irs_data;

CREATE TABLE IF NOT EXISTS taxpayers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    state VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS returns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    taxpayer_id INT,
    year INT,
    tax_paid DECIMAL(10, 2),
    refund DECIMAL(10, 2),
    filing_type VARCHAR(50),
    FOREIGN KEY (taxpayer_id) REFERENCES taxpayers(id)
);
