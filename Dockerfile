FROM nginx:alpine

RUN apk install fcgiwrap

COPY index.html /usr/share/nginx/html/index.html
CMD sh -c "sed -i -e 's/80;/${PORT};/g' /etc/nginx/conf.d/default.conf \
    && exec nginx -g 'daemon off;'"