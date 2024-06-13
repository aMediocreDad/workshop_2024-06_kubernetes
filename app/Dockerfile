FROM denoland/deno:latest

WORKDIR /app

COPY . .

RUN deno cache main.ts

CMD ["deno", "serve", "-E", "-S", "-N", "main.ts"]
