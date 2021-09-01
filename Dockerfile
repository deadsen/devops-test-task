FROM 224013136264.dkr.ecr.eu-central-1.amazonaws.com/deadsen/devops-test-task:base AS base
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
