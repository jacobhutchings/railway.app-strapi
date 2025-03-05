FROM node:18
# alternatively you can use FROM strapi/base:latest

# Set up working directory
WORKDIR /app

# Copy package.json to root directory
COPY package.json .

# Copy yarn.lock to root directory
COPY yarn.lock .

# Install dependencies, but not generate a yarn.lock file and fail if an update is needed
RUN yarn install --frozen-lockfile

# Copy strapi project files
COPY favicon.ico ./favicon.ico
COPY src/ src/
COPY public/ public/
COPY database/ database/
COPY config/ config/
COPY types/ types/
# ...

# Build admin panel
RUN yarn build

# Run on port 1337
EXPOSE 1337

# Start strapi server
CMD ["yarn", "start"]


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