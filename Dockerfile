FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y install curl jq && \
    apt-get clean -q

ENV SERVICE_ZOOKEEPER_HOST zookeeper
ENV SERVICE_ZOOKEEPER_PORT 2181
ENV SERVICE_ZOOKEEPER_PATH kafka

ENV SERVICE_KAFKA_MANAGER_HOST kafka-manager
ENV SERVICE_KAFKA_MANAGER_PORT 9000

ENV KAFKA_VERSION 0.10.1.0

ADD startup.sh /usr/bin/startup.sh

CMD ["/usr/bin/startup.sh"]
