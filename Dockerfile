FROM node:20

WORKDIR /usr/src/app

COPY . .
COPY ./src ./src

RUN yarn install --ignore-engines

RUN yarn build --ignore-engines

EXPOSE 1337

CMD ["yarn", "start  --ignore-engines"]