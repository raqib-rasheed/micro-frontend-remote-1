FROM node:14.19.1-alpine
WORKDIR /app
COPY package*.json ./
COPY yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

FROM nginx:1.23-alpine
WORKDIR /usr/share/nginx/remote-1/html
RUN rm -rf *
COPY --from=build /app/build .
EXPOSE 80
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

