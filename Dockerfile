FROM node:alpine as builder
#create alias
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
#expose post to world
COPY --from=builder /app/build /usr/share/nginx/html
#copy files from alias