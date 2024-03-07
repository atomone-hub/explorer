FROM node:alpine as builder

WORKDIR /app

COPY . .

RUN yarn install

RUN yarn build-only


FROM nginx

COPY --from=builder /app/dist /usr/share/nginx/html

CMD [ "nginx", "-g", "daemon off;" ]
