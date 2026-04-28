FROM debian:bullseye

RUN apt update -y && apt-get install mariadb-server -y netcat iputils-ping;

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mdb_setup.sh /mdb_setup.sh

RUN chmod +x /mdb_setup.sh

ENTRYPOINT ["./mdb_setup.sh"]
