#!/bin/bash
set -e

if [ -z "${CLUSTER_NAME}" ]
then
  CLUSTER_NAME="name"
fi

if [ -z "${ZK_HOSTS}" ]
then
  ZK_HOSTS="zookeeper:2181"
fi

if [ -z "${KAFKA_VERSION}" ]
then
  KAFKA_VERSION="0.11.0.0"
fi

if [ -z "${JMX_USER}" ]
then
  JMX_USER=""
fi

if [ -z "${JMX_PASS}" ]
then
  JMX_PASS=""
fi

if [ -z "${BROKER_VIEW_UPDATE_PERIOD_SECONDS}" ]
then
  BROKER_VIEW_UPDATE_PERIOD_SECONDS="30"
fi

if [ -z "${CLUSTER_MANAGER_THREAD_POOL_SIZE}" ]
then
  CLUSTER_MANAGER_THREAD_POOL_SIZE="2"
fi

if [ -z "${CLUSTER_MANAGER_THREAD_POOL_QUEUE_SIZE}" ]
then
  CLUSTER_MANAGER_THREAD_POOL_QUEUE_SIZE="100"
fi

if [ -z "${KAFKA_COMMAND_THREAD_POOL_SIZE}" ]
then
  KAFKA_COMMAND_THREAD_POOL_SIZE="2"
fi

if [ -z "${KAFKA_COMMAND_THREAD_POOL_QUEUE_SIZE}" ]
then
  KAFKA_COMMAND_THREAD_POOL_QUEUE_SIZE="100"
fi

if [ -z "${LOG_KAFKA_COMMAND_THREAD_POOL_SIZE}" ]
then
  LOG_KAFKA_COMMAND_THREAD_POOL_SIZE="2"
fi

if [ -z "${LOG_KAFKA_COMMAND_THREAD_POOL_QUEUE_SIZE}" ]
then
  LOG_KAFKA_COMMAND_THREAD_POOL_QUEUE_SIZE="100"
fi

if [ -z "${LOG_KAFKA_UPDATE_PERIOD_SECONDS}" ]
then
  LOG_KAFKA_UPDATE_PERIOD_SECONDS="30"
fi

if [ -z "${PARTITION_OFFSET_CACHE_TIMEOUT_SECS}" ]
then
  PARTITION_OFFSET_CACHE_TIMEOUT_SECS="5"
fi

if [ -z "${BROKER_VIEW_THREAD_POOL_SIZE}" ]
then
  PARTITION_OFFSET_CACHE_TIMEOUT_SECS="2"
fi

if [ -z "${BROKER_VIEW_THREAD_POOL_QUEUE_SIZE}" ]
then
  PARTITION_OFFSET_CACHE_TIMEOUT_SECS="1000"
fi

if [ -z "${OFFSET_CACHE_THREAD_POOL_SIZE}" ]
then
  OFFSET_CACHE_THREAD_POOL_SIZE="2"
fi

if [ -z "${OFFSET_CACHE_THREAD_POOL_QUEUE_SIZE}" ]
then
  OFFSET_CACHE_THREAD_POOL_QUEUE_SIZE="1000"
fi

if [ -z "${KAFKA_ADMIN_CLIENT_THREAD_POOL_SIZE}" ]
then
  KAFKA_ADMIN_CLIENT_THREAD_POOL_SIZE="2"
fi

if [ -z "${KAFKA_ADMIN_CLIENT_THREAD_POOL_QUEUE_SIZE}" ]
then
  KAFKA_ADMIN_CLIENT_THREAD_POOL_QUEUE_SIZE="1000"
fi

if [ -z "${SECURITY_PROTOCOL}" ]
then
  SECURITY_PROTOCOL="PLAINTEXT"
fi

echo Setup kafka manager
curl -v "http://${SERVICE_KAFKA_MANAGER_HOST}:${SERVICE_KAFKA_MANAGER_PORT}/clusters" \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    --data-urlencode "name=${CLUSTER_NAME}" \
    --data-urlencode "zkHosts=${ZK_HOSTS}" \
    --data-urlencode "kafkaVersion=${KAFKA_VERSION}" \
    --data-urlencode "jmxUser=${JMX_USER}" \
    --data-urlencode "jmxPass=${JMX_PASS}" \
    --data-urlencode "tuning.brokerViewUpdatePeriodSeconds=${BROKER_VIEW_UPDATE_PERIOD_SECONDS}" \
    --data-urlencode "tuning.clusterManagerThreadPoolSize=${BROKER_VIEW_THREAD_POOL_SIZE}" \
    --data-urlencode "tuning.clusterManagerThreadPoolQueueSize=${BROKER_VIEW_THREAD_POOL_QUEUE_SIZE}" \
    --data-urlencode "tuning.kafkaCommandThreadPoolSize=${KAFKA_COMMAND_THREAD_POOL_SIZE}" \
    --data-urlencode "tuning.kafkaCommandThreadPoolQueueSize=${KAFKA_COMMAND_THREAD_POOL_QUEUE_SIZE}" \
    --data-urlencode "tuning.logkafkaCommandThreadPoolSize=${LOG_KAFKA_COMMAND_THREAD_POOL_SIZE}" \
    --data-urlencode "tuning.logkafkaCommandThreadPoolQueueSize=${LOG_KAFKA_COMMAND_THREAD_POOL_QUEUE_SIZE}" \
    --data-urlencode "tuning.logkafkaUpdatePeriodSeconds=${LOG_KAFKA_UPDATE_PERIOD_SECONDS}" \
    --data-urlencode "tuning.partitionOffsetCacheTimeoutSecs=${PARTITION_OFFSET_CACHE_TIMEOUT_SECS}" \
    --data-urlencode "tuning.brokerViewThreadPoolSize=${BROKER_VIEW_THREAD_POOL_SIZE}" \
    --data-urlencode "tuning.brokerViewThreadPoolQueueSize=${BROKER_VIEW_THREAD_POOL_QUEUE_SIZE}" \
    --data-urlencode "tuning.offsetCacheThreadPoolSize=${OFFSET_CACHE_THREAD_POOL_SIZE}" \
    --data-urlencode "tuning.offsetCacheThreadPoolQueueSize=${OFFSET_CACHE_THREAD_POOL_QUEUE_SIZE}" \
    --data-urlencode "tuning.kafkaAdminClientThreadPoolSize=${KAFKA_ADMIN_CLIENT_THREAD_POOL_SIZE}" \
    --data-urlencode "tuning.kafkaAdminClientThreadPoolQueueSize=${KAFKA_ADMIN_CLIENT_THREAD_POOL_QUEUE_SIZE}" \
    --data-urlencode "securityProtocol=${SECURITY_PROTOCOL}"
