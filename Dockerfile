FROM node:20

WORKDIR /usr/src/app

COPY . .
COPY ./src ./src

RUN yarn install

EXPOSE 1337

CMD ["yarn", "start"]