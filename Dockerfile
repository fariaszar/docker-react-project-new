FROM node:alpine as build-step 
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx
COPY --from=build-step /app/build  /usr/share/nginx/html