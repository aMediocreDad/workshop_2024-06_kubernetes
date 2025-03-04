import { Hono } from "jsr:@hono/hono@4";

const app = new Hono();

app.get("/items/:id", (c) => {
	const { id } = c.req.param();
	return c.json({ id });
});

export default app;
