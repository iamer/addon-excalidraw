FROM node:18-alpine AS build

ENV LANG=C.UTF-8

WORKDIR /opt/node_app
RUN apk add git
RUN git clone --branch release https://github.com/excalidraw/excalidraw.git .
COPY 0001-Make-VITE_APP_WS_SERVER_URL-configurable.patch .
COPY 0002-Allow-collbaoration-in-an-iframe.patch .
RUN git config --global user.email "john.doe@github.com"
RUN git config --global user.name "John Doe"
RUN git am 0001-Make-VITE_APP_WS_SERVER_URL-configurable.patch
RUN git am 0002-Allow-collbaoration-in-an-iframe.patch

RUN --mount=type=cache,target=/root/.cache/yarn npm_config_target_arch=arm64 yarn --network-timeout 600000
ARG NODE_ENV=production
RUN --mount=type=cache,target=/root/.cache/yarn npm_config_target_arch=arm64 yarn --network-timeout 600000 build:app:docker

FROM --platform=linux/aarch64 nginx:1.27-alpine

COPY --from=build /opt/node_app/excalidraw-app/build /usr/share/nginx/html
COPY --chmod=0755 99-copy-hassio-config.sh /docker-entrypoint.d/

HEALTHCHECK CMD wget -q -O /dev/null http://localhost || exit 1

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="aarch64"
