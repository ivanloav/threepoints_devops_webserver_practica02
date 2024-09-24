FROM node:10-alpine

WORKDIR /usr/src/app

COPY src/package*.json ./
RUN npm install

COPY src/index.js .

EXPOSE 8090

CMD [ "node", "index.js" ]
