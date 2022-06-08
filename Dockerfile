FROM node as buildS
WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm install
RUN npm run build
FROM nginx
COPY --from=buildS /usr/local/app/dist/frontend /usr/share/nginx/html
EXPOSE 80