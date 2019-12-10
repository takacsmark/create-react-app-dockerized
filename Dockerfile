FROM node:12.13.1 as builder

WORKDIR /app
COPY package.json yarn.lock ./

RUN npm install

COPY src src
COPY public public
RUN npm run build

FROM nginx:1.17
COPY --from=builder /app/build /usr/share/nginx/html/

