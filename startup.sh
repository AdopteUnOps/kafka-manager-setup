#!/bin/bash
set -e

echo Setup kafka manager
curl "http://${SERVICE_KAFKA_MANAGER_HOST}:${SERVICE_KAFKA_MANAGER_PORT}/clusters" \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    --data "name=kafka&zkHosts=${SERVICE_ZOOKEEPER_HOST}%3A${SERVICE_ZOOKEEPER_PORT}%2F${SERVICE_ZOOKEEPER_PATH}&kafkaVersion=${KAFKA_VERSION}&jmxUser=&jmxPass=&tuning.brokerViewUpdatePeriodSeconds=30&tuning.clusterManagerThreadPoolSize=2&tuning.clusterManagerThreadPoolQueueSize=100&tuning.kafkaCommandThreadPoolSize=2&tuning.kafkaCommandThreadPoolQueueSize=100&tuning.logkafkaCommandThreadPoolSize=2&tuning.logkafkaCommandThreadPoolQueueSize=100&tuning.logkafkaUpdatePeriodSeconds=30&tuning.partitionOffsetCacheTimeoutSecs=5&tuning.brokerViewThreadPoolSize=2&tuning.brokerViewThreadPoolQueueSize=1000&tuning.offsetCacheThreadPoolSize=2&tuning.offsetCacheThreadPoolQueueSize=1000&tuning.kafkaAdminClientThreadPoolSize=2&tuning.kafkaAdminClientThreadPoolQueueSize=1000"
