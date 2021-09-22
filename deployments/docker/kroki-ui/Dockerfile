FROM nginx:1.19-alpine
ARG VERSION=v9.21.0
RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN rm -rf /usr/share/nginx/html
COPY --chown=nginx:nginx . /usr/share/nginx/html
