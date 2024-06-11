FROM oven/bun:1
WORKDIR /usr/src/app

COPY ./src .
COPY package.json package.json

RUN bun i

ENV PORT=1337

USER bun
EXPOSE $PORT/tcp

CMD ["bun", "run", "index.ts"]