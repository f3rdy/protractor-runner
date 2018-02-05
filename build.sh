#!/bin/bash

DOCKER_IMAGE_NAME="protractor-runner"

# retrieve proxy values from environment
if [ ! -z ${https_proxy+x} ]; then
DOCKER_BUILD_ENV="--build-arg https_proxy=$https_proxy"
fi

if [ ! -z ${http_proxy+x} ]; then
DOCKER_BUILD_ENV="${DOCKER_BUILD_ENV} --build-arg http_proxy=$http_proxy"
fi

docker build ${DOCKER_BUILD_ENV} -t ${DOCKER_IMAGE_NAME} .
