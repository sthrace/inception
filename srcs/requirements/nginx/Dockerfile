FROM debian:buster

RUN apt-get update
RUN	apt-get install -y openssl nginx
RUN rm /etc/nginx/sites-enabled/default && rm /etc/nginx/sites-available/default
COPY	conf/nginx.conf	/etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    	-subj "/C=ru/ST=Central/L=Moscow/O=CodingSchool/OU=6thWave/CN=sthrace/" \
    	-keyout /etc/ssl/sthrace.key \
    	-out /etc/ssl/sthrace.crt
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]

# FROM    alpine:3.12

# RUN     apk update

# RUN     apk add openssl nginx bash
# RUN		rm /etc/nginx/conf.d/default.conf
# COPY    conf/nginx.conf        /etc/nginx/conf.d/default.conf

# RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     	-subj "/C=ru/ST=Central/L=Moscow/O=CodingSchool/OU=6thWave/CN=sthrace/" \
#     	-keyout /etc/ssl/sthrace.key \
#     	-out /etc/ssl/sthrace.crt
# RUN 	mkdir -p /run/nginx

# EXPOSE  443
# CMD [ "nginx", "-g", "daemon off;" ]
