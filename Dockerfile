FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

#copy over all our source code to the container
COPY . .

RUN npm run build


FROM nginx
EXPOSE 80
#from builder take the rest to nginx 
COPY --from=builder /app/build /usr/share/nginx/html


