FROM java:8-jdk-alpine
MAINTAINER ibnu yahya <anak10thn@gmail.com>

ENV LANG=C.UTF-8 LC_ALL=C
ENV SRC="."
ENV WORK="/opt"

WORKDIR $WORK
COPY $SRC/entrypoint.sh /entrypoint.sh
COPY $SRC/elasticsearch.yml /tmp

RUN cd /opt; \
    apk update; \
    apk add openssl; \
    wget -t 10 -c https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.4.1/elasticsearch-2.4.1.tar.gz; \
    tar vxf elasticsearch-2.4.1.tar.gz; \
    rm elasticsearch-2.4.1.tar.gz; \
    mv elasticsearch-2.4.1 es; \
    adduser -s /bin/sh -S am; \
    mkdir -p /opt/es/data; \
    mv /tmp/elasticsearch.yml /opt/es/config; \
    chown am -R /opt/es;

EXPOSE 9200
WORKDIR $WORK
USER am
ENTRYPOINT ["/entrypoint.sh"]
