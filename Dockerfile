FROM node:16.15.0

# Create App Directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Install `serve` to run the application. 
RUN npm i -g serve

# Copy app source code
COPY --chown=node:node . .

# Build for production.
RUN npm run build

# change the ownership to node user
RUN chown -R node:node /usr/src/app

# change root user to node
USER node

# Set the command to start the node server.
CMD ["serve", "-s", "build"]

# Container PORT
EXPOSE 3000
