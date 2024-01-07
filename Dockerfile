FROM node:14.19.1-alpine
WORKDIR /app
COPY package*.json ./
COPY yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build:prod
RUN yarn global add serve
EXPOSE 4000
CMD ["serve" ,"-s","build","-l","3006"]
