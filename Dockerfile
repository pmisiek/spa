FROM nginx:1.17.1-alpine
COPY ./dist/hello-spa /usr/share/nginx/html
