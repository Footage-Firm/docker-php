#!/bin/bash

TAG=${1:-latest}
CMD="docker push videoblocks/docker-php:$TAG"

echo "Running: $CMD"
$CMD
