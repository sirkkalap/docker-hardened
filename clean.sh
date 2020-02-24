#!/usr/bin/env bash

BASEDIR=$(cd $(dirname $0); /bin/pwd)
set -e

(
    cd "${BASEDIR}/app"
    ./gradlew --no-daemon clean
)

docker stop awesome-service || true
docker rm awesome-service || true
docker rmi awesome:latest || true
