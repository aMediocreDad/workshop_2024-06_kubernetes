import { Hono } from 'hono'
import { env } from "bun"
import postgres from "postgres"
import prexit from 'prexit'

const { DB_SERVICE_SERVICE_HOST = "", DB_SERIVCE_SERVICE_PORT = "" } = env

const sql = postgres({
  host: DB_SERVICE_SERVICE_HOST, port: parseInt(DB_SERIVCE_SERVICE_PORT)
})

const app = new Hono()

app.get('/items/create', async (c) => {
  const items = [
    { name: 'Toothbrush' },
    { name: 'Sleeping Bag' },
    { name: 'Pillow' },
    { name: 'Tent' },
  ]

  const table = await sql`CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  )`
  const created = await sql`INSERT INTO items ${sql(items)} RETURNING *`
  return c.json({ table, items: created })
});

app.get('/items/:id', async (c) => {
  const { id } = c.req.param()
  const item = await sql`SELECT * FROM items WHERE id = ${id}`
  return c.json(item)
});

prexit(async () => {
  await sql.end()
});

export default app
