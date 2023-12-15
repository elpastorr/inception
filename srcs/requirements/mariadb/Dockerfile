FROM alpine:3.18

ARG DATABASE_USER
ARG DATABASE_USER_PASSWORD
ARG DATABASE_NAME
ARG DATABASE_ROOT_PASSWORD
ARG DATABASE_ROOT_PASSWORD

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY ./conf/my.conf /etc/mysql/my.conf

COPY ./tools/mariadb.sh /usr/local/bin/mariadb.sh

RUN chmod +x /usr/local/bin/mariadb.sh && ash -f /usr/local/bin/mariadb.sh

EXPOSE 3306

CMD ["mariadbd-safe"]
