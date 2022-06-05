FROM node:18.2.0-alpine3.15

WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY --chown=node:node src/. .

# Update NPM to 8.11.x new minor release and install node package dependencies
RUN set -eu && \
    npm install -g npm@8.12.1 && \
    npm install && \
    chown -R node:node -R .

# If you are building your code for production:
# RUN npm ci --only=production

EXPOSE 8080

USER node

CMD [ "node", "server.js" ]
