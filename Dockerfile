FROM nginx

MAINTAINER quinn snyder <quinn.snyder@wwt.com>

RUN rm /usr/share/nginx/html/index.html
RUN rm /usr/share/nginx/html/50x.html

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY www /usr/share/nginx/html
