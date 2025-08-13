FROM alpine AS buildha

ENV LANG C.UTF-8

WORKDIR /
RUN apk add git
RUN git clone https://github.com/excalidraw/excalidraw.git
RUN cd excalidraw; git checkout origin/release
WORKDIR excalidraw

FROM node:18 AS build

WORKDIR /opt/node_app

COPY --from=buildha excalidraw .
RUN --mount=type=cache,target=/root/.cache/yarn npm_config_target_arch=arm64 yarn --network-timeout 600000
ARG NODE_ENV=production
RUN --mount=type=cache,target=/root/.cache/yarn npm_config_target_arch=arm64 yarn --network-timeout 600000 build:app:docker

FROM --platform=linux/aarch64 nginx:1.27-alpine

COPY --from=build /opt/node_app/excalidraw-app/build /usr/share/nginx/html

HEALTHCHECK CMD wget -q -O /dev/null http://localhost || exit 1

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="aarch64"
