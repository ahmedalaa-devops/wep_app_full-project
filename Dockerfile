FROM nginx:1.26.4-alpine

COPY ./ /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]