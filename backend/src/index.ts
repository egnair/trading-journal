import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'

dotenv.config()

const app = express()
const PORT = process.env.PORT || 5000

// Middleware
app.use(cors())
app.use(express.json())

// Routes
app.get('/api/health', (req, res) => {
  res.json({ status: 'OK', message: 'Trading Journal API is running' })
})

// Trades endpoints
app.get('/api/trades', (req, res) => {
  res.json({ trades: [] })
})

app.post('/api/trades', (req, res) => {
  res.status(201).json({ message: 'Trade created', trade: req.body })
})

// Analytics endpoints
app.get('/api/analytics/summary', (req, res) => {
  res.json({
    totalTrades: 35,
    winRate: 0.64,
    netPnL: 3240,
    maxDrawdown: -0.085,
  })
})

app.get('/api/analytics/performance', (req, res) => {
  res.json({
    byDay: {},
    byHour: {},
    cumulative: [],
  })
})

// Error handling middleware
app.use((err: any, req: express.Request, res: express.Response, next: express.NextFunction) => {
  console.error(err)
  res.status(500).json({ error: 'Internal server error' })
})

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`)
})
