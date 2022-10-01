#########################
# Build for DEVELOPMENT #
#########################

# Use node LTS release.
FROM node:16-alpine As development

# Change working directory, and copy required files.
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./

# Always clean install dependencies.
RUN npm ci

# Bundle app source code.
COPY --chown=node:node . .

# Create a non-root user.
USER node

########################
# Build for PRODUCTION #
########################

FROM node:16-alpine As build
WORKDIR /usr/src/app
COPY --chown=node:node package*.json ./

# We need access to Nest CLI to build app. Hence copying the node_modules folder from development stage.
COPY --chown=node:node --from=development /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .

RUN npm run build

ENV NODE_ENV production

# Clean build for production only, and keep only minimal node_modules needed for production.
RUN npm ci --only=production && npm cache clean --force

USER node

#########################
# PRODUCTION
#########################
FROM node:16-alpine As production

# Copy bundled code from build stage to production image.
COPY --chown=node:node --from=build /usr/src/app/node_modules ./node_modules
COPY --chown=node:node --from=build /usr/src/app/dist ./dist

# Start the server using production build.
CMD [ "node", "dist/src/main" ]
