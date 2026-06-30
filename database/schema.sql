-- Create database if not exists
CREATE DATABASE trading_journal;

-- Users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  username VARCHAR(100) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Accounts table
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  account_name VARCHAR(255) NOT NULL,
  broker VARCHAR(100),
  initial_balance DECIMAL(12, 2),
  currency VARCHAR(10) DEFAULT 'USD',
  api_key VARCHAR(255),
  api_secret VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Trades table
CREATE TABLE trades (
  id SERIAL PRIMARY KEY,
  account_id INTEGER NOT NULL,
  symbol VARCHAR(20) NOT NULL,
  entry_date TIMESTAMP NOT NULL,
  entry_price DECIMAL(12, 6) NOT NULL,
  exit_date TIMESTAMP,
  exit_price DECIMAL(12, 6),
  quantity DECIMAL(12, 4) NOT NULL,
  side VARCHAR(10) NOT NULL, -- 'long' or 'short'
  pnl DECIMAL(12, 2),
  pnl_percent DECIMAL(8, 4),
  status VARCHAR(20) NOT NULL DEFAULT 'open', -- 'open', 'closed'
  notes TEXT,
  entry_time_of_day VARCHAR(20),
  entry_day_of_week VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE CASCADE,
  INDEX idx_account_date (account_id, entry_date),
  INDEX idx_symbol (symbol)
);

-- Analytics table (cached)
CREATE TABLE analytics_cache (
  id SERIAL PRIMARY KEY,
  account_id INTEGER NOT NULL,
  metric_type VARCHAR(50) NOT NULL,
  metric_date DATE NOT NULL,
  value JSONB,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE CASCADE,
  UNIQUE(account_id, metric_type, metric_date)
);

-- Streaks table
CREATE TABLE streaks (
  id SERIAL PRIMARY KEY,
  account_id INTEGER NOT NULL,
  streak_type VARCHAR(20) NOT NULL, -- 'win' or 'loss'
  streak_length INTEGER NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE CASCADE
);

-- Create indexes
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_account_user ON accounts(user_id);
CREATE INDEX idx_trade_account ON trades(account_id);
