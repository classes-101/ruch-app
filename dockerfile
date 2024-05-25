FROM node AS ruchi
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build 
RUN ls /app/dist/

FROM nginx
COPY --from=ruchi /app/dist/ruchi-app/browser/ /usr/share/nginx/html/