#!/bin/bash

TAG=${1:-latest}
CMD="docker build -t videoblocks/docker-php:$TAG ."

echo "Running: $CMD"
$CMD
