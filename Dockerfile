FROM node:18.2.0-alpine3.15

RUN set -eu && \
    wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
    echo "e874b55f3279ca41415d290c512a7ba9d08f98041b28ae7c2acb19a545f1c4df  /usr/local/bin/dumb-init" | sha256sum -c - && \
    chmod 755 /usr/local/bin/dumb-init

WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY --chown=node:node src/. .

# Update NPM to 8.12.x new minor release and install node package dependencies
RUN set -eu && \
    npm install -g npm@8.12.1 && \
    npm install && \
    chown -R node:node -R .

# If you are building your code for production:
# RUN npm ci --only=production

EXPOSE 8080

USER node

CMD [ "dumb-init", "node", "server.js" ]
