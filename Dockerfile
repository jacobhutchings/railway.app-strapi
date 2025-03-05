FROM node:20
# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/
COPY package.json yarn.lock ./
RUN yarn global add node-gyp
RUN yarn config set network-timeout 600000 -g && yarn install
ENV PATH=/opt/node_modules/.bin:$PATH

WORKDIR /opt/app
COPY . .
RUN chown -R node:node /opt/app
USER node
RUN ["yarn", "build"]
EXPOSE 1337
CMD ["yarn", "develop"]

# FROM node:18
# # alternatively you can use FROM strapi/base:latest

# # Set up working directory
# WORKDIR /app

# # Copy package.json to root directory
# COPY package.json .

# # Copy yarn.lock to root directory
# COPY yarn.lock .

# # Install dependencies, but not generate a yarn.lock file and fail if an update is needed
# RUN yarn install --frozen-lockfile

# # Copy strapi project files
# COPY src/ src/
# COPY public/ public/
# COPY database/ database/
# COPY config/ config/
# COPY types/ types/
# # ...

# # Build admin panel
# RUN yarn build

# # Run on port 1337
# EXPOSE 1337

# # Start strapi server
# CMD ["yarn", "start"]


# FROM node:20

# WORKDIR /usr/src/app

# COPY . .
# COPY ./src ./src

# RUN yarn install
# RUN yarn build

# # Set production environment
# ENV NODE_ENV production

# EXPOSE 1337

# CMD ["yarn", "start"]