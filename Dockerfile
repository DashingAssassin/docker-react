FROM node:alpine as builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .
#CMD [ "npm","run" ,"build"]
RUN npm run build

# /app/build  all build files
FROM nginx
EXPOSE 80
#copy something from a phase
COPY --from=0 /app/build /usr/share/nginx/html
