FROM    debian:buster

RUN     apt-get -y update
RUN     apt-get -y upgrade

RUN     apt-get install -y wget openssl nginx

RUN     openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 -subj "/C=RU/ST=Moscow/L=School21/O=6Wave/CN=sthrace" \
        -keyout /etc/ssl/private/nginx.key \
        -out /etc/ssl/certs/nginx.crt
COPY    /conf/nginx.conf        /etc/nginx
COPY    /tools/start.sh         /

EXPOSE  80 443

ENTRYPOINT      sh start.sh
~                                
