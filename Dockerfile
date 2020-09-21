FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# CMD ["./node_modules/serve/bin/serve.js", "-s", "build"]

FROm nginx
COPY --from=builder /app/build /usr/share/nginx/html
