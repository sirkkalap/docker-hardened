#!/usr/bin/env bash

BASEDIR=$(cd $(dirname $0); /bin/pwd)
set -e

cd "${BASEDIR}"
app/gradlew build
cp app/build/libs/rest-service-0.0.1-SNAPSHOT.jar docker/awesome.jar

cd docker
docker build . --tag awesome:latest
docker run --user $(id -u):$(id -g) -p 127.0.0.1:8080:8080 awesome:latest
