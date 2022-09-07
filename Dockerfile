FROM node:12.18.3

# This also creates the directory if it doesn't exist.
# (This frequently is "/app".)
WORKDIR /Portfolio

# We ran `git clone` on the host outside of Docker.
# Copy in only the files we need to install dependencies.
COPY package*.json ./
RUN npm install

# Now copy in the rest of the application.
# (`node_modules` should be included in `.dockerignore`.)
COPY . ./
# RUN npm build

# Standard metadata to start the application.
EXPOSE 8080
CMD ["pm2", "start", "./bin/ww"]
# (Do you actually need a process manager inside a Docker container?)
# CMD ["node", "./bin/ww"]
