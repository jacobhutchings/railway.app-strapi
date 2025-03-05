FROM node:20

WORKDIR /usr/src/app

COPY package.json ./
COPY tsconfig.json ./
COPY ./src ./src

RUN npm install

EXPOSE 1337

CMD ["npm", "start"]