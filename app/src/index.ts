import { Hono } from 'hono'

const app = new Hono()

app.get('/items/:slug', (c) => {
  const { slug } = c.req.param();
  return c.json({ slug })
});

export default app
