FROM node:lts-alpine AS base
WORKDIR /app
COPY package.json .
RUN npm install --only=production

FROM base AS release
ENV NODE_ENV=production
COPY --from=dependencies /app/node_modules ./node_modules
COPY . .
EXPOSE 3050
CMD npm run start
