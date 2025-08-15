#!/bin/sh

if [ -f "/data/options.json" ]; then
  cp /data/options.json /usr/share/nginx/html/env.json
fi
