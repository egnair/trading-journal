# Trading Journal

A comprehensive trading journal application designed to help traders analyze performance, track metrics, and build better trading habits. Inspired by legendjournal.me.

## Features

- **Automated Trade Tracking**: Sync with trading accounts to automatically import closed trades
- **Performance Analytics Dashboard**: View key metrics at a glance (win rate, P&L, drawdown, R:R ratio)
- **Trading Calendar**: Visualize results by day, week, and month
- **Performance Insights**:
  - Average holding time (winning vs. losing trades)
  - Maximum drawdown analysis
  - Best/worst trade identification
  - Entry time analysis
  - Day-of-week performance patterns
  - Winning/losing streak tracking
- **Behavior & Habit Tracking**: Understand what's working, eliminate emotional decisions
- **Risk Management Tools**: Monitor exposure and risk metrics

## Tech Stack

- **Frontend**: React with TypeScript, Tailwind CSS
- **Backend**: Node.js/Express or Python/FastAPI
- **Database**: PostgreSQL
- **Authentication**: JWT-based auth with secure session management
- **Data Visualization**: Chart.js or Recharts for analytics

## Project Structure

```
trading-journal/
├── frontend/           # React TypeScript application
├── backend/            # API server
├── database/           # Schema and migrations
├── docs/               # Documentation
└── README.md
```

## Getting Started

### Prerequisites
- Node.js 18+
- PostgreSQL 13+
- Python 3.9+ (if using Python backend)

### Installation

```bash
# Clone the repository
git clone https://github.com/egnair/trading-journal.git
cd trading-journal

# Frontend setup
cd frontend
npm install

# Backend setup
cd ../backend
npm install
# or for Python
pip install -r requirements.txt
```

### Development

```bash
# Start frontend dev server (runs on port 3000)
cd frontend
npm start

# Start backend dev server (runs on port 5000)
cd backend
npm run dev
# or for Python
python app.py
```

## License

MIT
