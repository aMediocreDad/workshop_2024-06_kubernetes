import { Hono } from "jsr:@hono/hono@4";
import postgres from "jsr:@y0/postgres@3";
import prexit from "npm:prexit";

const app = new Hono();

const sql = postgres({
	host: Deno.env.get("DB_SERVICE_SERVICE_HOST"),
	port: Number.parseInt(Deno.env.get("DB_SERVICE_SERVICE_PORT")),
});

app.post("/items", async (c) => {
	const items = [
		{ name: "Toothbrush" },
		{ name: "Sleeping Bag" },
		{ name: "Pillow" },
		{ name: "Tent" },
	];

	const table = await sql`CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  )`;
	const created = await sql`INSERT INTO items ${sql(items)} RETURNING *`;
	return c.json({ table, items: created });
});

app.get("/items/:id", async (c) => {
	const { id } = c.req.param();
	const item = await sql`SELECT * FROM items WHERE id = ${id}`;
	return c.json(item);
});

prexit(async () => {
	await sql.end();
});

export default app;
