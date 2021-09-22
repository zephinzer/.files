FROM nginx:1.19-alpine
ARG VERSION=v9.21.0
RUN apk update --no-cache
RUN apk upgrade --no-cache
RUN curl -Lo /opt/cyberchef.zip https://github.com/gchq/CyberChef/releases/download/${VERSION}/CyberChef_${VERSION}.zip \
  && unzip /opt/cyberchef.zip -d /usr/share/nginx/html \
  && rm -rf /usr/share/nginx/html/index.html /opt/cyberchef.zip \
  && mv /usr/share/nginx/html/CyberChef_v9.21.0.html /usr/share/nginx/html/index.html
