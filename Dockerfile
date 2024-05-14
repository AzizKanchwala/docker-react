FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Need EXPOSE 80 for ElasticBeanStalk. No explicit there.
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html