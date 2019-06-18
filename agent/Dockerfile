FROM node:12.4.0

ENV APP_ROOT /workspace
WORKDIR $APP_ROOT

COPY agent/package.json $APP_ROOT

RUN npm i

CMD node bot.js
