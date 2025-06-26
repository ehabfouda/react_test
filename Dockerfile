FROM node:alpine3.22 as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
run npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

