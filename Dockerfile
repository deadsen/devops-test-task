FROM alpine:3.14.2 AS base
RUN mkdir /app
RUN apk add --no-cache npm nodejs
WORKDIR /app
COPY package.json .

FROM base AS dependencies
RUN npm install --only=production
RUN cp -R node_modules prod_node_modules
RUN npm install

FROM base AS release
ENV NODE_ENV=production
COPY --from=dependencies /app/prod_node_modules ./node_modules
COPY . .
EXPOSE 3050
CMD npm run start
