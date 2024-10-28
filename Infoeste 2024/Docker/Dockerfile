FROM node:14

WORKDIR /docker

COPY package*.json ./

RUN npm install

EXPOSE 3000

CMD ["node", "app.js"]
