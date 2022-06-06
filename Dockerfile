ARG BASE_IMAGE=node
ARG BASE_IMAGE_TAG=18.2.0-alpine3.15
ARG BASE_IMAGE_SHA256=8a7f5435fd83f6d1dbdeff2decad2275b2550d28cacf7acd653d2cbaee957965

FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}@sha256:${BASE_IMAGE_SHA256}

ARG NPM_VERSION=8.12.1

RUN set -eu && \
    apk add --no-cache tini

WORKDIR /usr/src/app

COPY --chown=node:node src/. .

RUN set -eu && \
    npm install -g npm@${NPM_VERSION} && \
    npm install && \
    chown -R node:node -R .

# If you are building your code for production:
# RUN npm ci --only=production

EXPOSE 8080

USER node

ENTRYPOINT [ "/sbin/tini", "--" ]

CMD [ "node", "server.js" ]
