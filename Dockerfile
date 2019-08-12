FROM node:12.8-alpine

ENV NPM_CONFIG_LOGLEVEL info

WORKDIR /usr/src/app
# Installs latest Chromium (73) package.
RUN apk update && apk upgrade && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    apk add --no-cache \
      chromium@edge=~72.0.3626.121-r0 \
      nss@edge \
      freetype@edge \
      freetype-dev@edge \
      harfbuzz@edge \
      ttf-freefont@edge

COPY server.js .
RUN npm install prerender@5.6 
RUN addgroup -S preuser && adduser -S -g preuser preuser \
    && mkdir -p /home/preuser/Downloads /app \
    && chown -R preuser:preuser /home/preuser \
    && chown -R preuser:preuser /usr/src/app
    
USER preuser

EXPOSE $PORT

CMD [ "node", "server.js" ]