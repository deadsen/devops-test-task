FROM node:lts-alpine AS dependencies
WORKDIR /app
COPY package.json .
RUN npm install --only=production

FROM node:lts-alpine AS release
ENV NODE_ENV=production
WORKDIR /app
COPY --from=dependencies /app/node_modules ./node_modules
COPY . .
EXPOSE 3050
CMD npm run start
