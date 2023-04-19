# syntax=docker/dockerfile:1.4

FROM node:lts-alpine3.17

RUN apk add --no-cache \
	curl tar bash tini \
	gettext

WORKDIR /opt/code

COPY package.json package-lock.json ./
RUN npm install
COPY . .

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "-c", "envsubst < .env.example > .env && npm start"] 
