FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


# When creating a pull request, some checks will be run.
# After they are run successfully, they will be merged to master
# Once merged, a new build will run to deploy on ElasticBeanStalk


# Dockerfile.dev might be used for local deployments while
# Dockerfile might be used for production deployments
