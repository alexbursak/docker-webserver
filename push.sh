#!/usr/bin/env bash

ARG="$1"
TAG='latest'

if [[ -z "$ARG" ]]
then
    TAG='amd'
else
    TAG=$ARG
fi

docker push alexbursak/webserver:"$TAG"