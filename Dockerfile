# specify the base image
FROM node:alpine as builder

# configuration setup
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# start the nginx
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
