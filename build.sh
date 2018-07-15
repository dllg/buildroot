#!/bin/bash

NAME="buildroot"
ARG_UID=$(id -u)

docker build -t $NAME --build-arg UID=$ARG_UID .
