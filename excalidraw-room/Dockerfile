FROM node:12-alpine AS build

ENV LANG=C.UTF-8

WORKDIR /opt/node_app
RUN apk add git
RUN git clone https://github.com/excalidraw/excalidraw-room.git .

RUN --mount=type=cache,target=/root/.cache/yarn npm_config_target_arch=arm64 yarn --network-timeout 600000
RUN --mount=type=cache,target=/root/.cache/yarn npm_config_target_arch=arm64 yarn --network-timeout 600000 build

FROM --platform=linux/aarch64 node:12-alpine

COPY --from=build /opt/node_app /opt/node_app

EXPOSE 80

WORKDIR /opt/node_app
CMD ["yarn", "start"]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="aarch64"
