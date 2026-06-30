# Trading Journal API Documentation

## Base URL
`http://localhost:5000/api`

## Authentication
All endpoints (except `/auth/login` and `/auth/register`) require a Bearer token in the Authorization header:
```
Authorization: Bearer <token>
```

## Endpoints

### Authentication
- `POST /auth/register` - Create new user account
- `POST /auth/login` - Login and get JWT token
- `POST /auth/logout` - Logout (invalidate token)

### Accounts
- `GET /accounts` - List all accounts for current user
- `POST /accounts` - Create new trading account
- `GET /accounts/:id` - Get account details
- `PUT /accounts/:id` - Update account settings
- `DELETE /accounts/:id` - Delete account

### Trades
- `GET /accounts/:accountId/trades` - List trades
- `POST /accounts/:accountId/trades` - Add new trade
- `GET /accounts/:accountId/trades/:tradeId` - Get trade details
- `PUT /accounts/:accountId/trades/:tradeId` - Update trade
- `DELETE /accounts/:accountId/trades/:tradeId` - Delete trade
- `GET /accounts/:accountId/trades/sync` - Sync trades from broker API

### Analytics
- `GET /accounts/:accountId/analytics/summary` - Get performance summary
  - Returns: total trades, win rate, net P&L, max drawdown
- `GET /accounts/:accountId/analytics/performance` - Get detailed analytics
  - Returns: performance by day, hour, winning/losing streaks
- `GET /accounts/:accountId/analytics/calendar` - Get calendar view data
- `GET /accounts/:accountId/analytics/time-analysis` - Get entry time analysis
- `GET /accounts/:accountId/analytics/day-of-week` - Get day-of-week performance

## Trade Object
```json
{
  "id": 1,
  "symbol": "EURUSD",
  "entryDate": "2024-01-15T10:30:00Z",
  "entryPrice": 1.0850,
  "exitDate": "2024-01-15T14:45:00Z",
  "exitPrice": 1.0875,
  "quantity": 1,
  "side": "long",
  "pnl": 250,
  "pnlPercent": 0.23,
  "status": "closed",
  "notes": "Strong breakout trade"
}
```

## Error Response
```json
{
  "error": "Error message",
  "code": "ERROR_CODE",
  "status": 400
}
```
