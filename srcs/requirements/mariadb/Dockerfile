FROM alpine:3.12

RUN apk update
RUN apk add openrc mariadb mariadb-common mariadb-client
VOLUME  ["/sys/fs/cgroup"]
COPY    conf/mysql.sh .
RUN     chmod +x mysql.sh
EXPOSE 3306
ENTRYPOINT [ "sh", "/mysql.sh" ]
