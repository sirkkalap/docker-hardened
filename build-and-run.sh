#!/usr/bin/env bash

BASEDIR=$(cd $(dirname $0); /bin/pwd)
set -e

(
    cd "${BASEDIR}/app"
    ./gradlew --no-daemon build
)

docker build . --tag awesome:latest
docker run --name awesome-service --user $(id -u):$(id -g) -p 127.0.0.1:8080:8080 awesome:latest
