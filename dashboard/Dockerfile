FROM node:12.4.0

ENV APP_ROOT /workspace
WORKDIR $APP_ROOT
COPY dashboard/package.json $APP_ROOT

RUN npm i

CMD node server.js
