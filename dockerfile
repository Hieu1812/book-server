FROM public.ecr.aws/docker/library/alpine:3.21

WORKDIR /usr/src/app

# Copy package files with correct ownership
COPY --chown=node:node package*.json ./
RUN npm install 

# Copy the rest of the files with correct ownership
COPY --chown=node:node . .

EXPOSE 3005

USER node

CMD ["npm", "start"]