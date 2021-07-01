FROM alpine:3.12

RUN apk update
RUN	apk add openssl nginx bash
COPY	conf/nginx.conf	/etc/nginx/conf.d/default.conf
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    	-subj "/C=ru/ST=Central/L=Moscow/O=CodingSchool/OU=6thWave/CN=sthrace/" \
    	-keyout /etc/ssl/sthrace.key \
    	-out /etc/ssl/sthrace.crt
RUN		mkdir -p /run/nginx
EXPOSE 443
ENTRYPOINT [ "nginx" ]
CMD	[ "-g", "daemon off;" ]