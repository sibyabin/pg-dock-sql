#!/bin/bash

error_exit() {
    echo "ERROR:Could not find a working docker setup. Please refer https://docs.docker.com/engine/install/"
    exit 1
}

check_prerequisites() {
    echo "INFO:Searching for a working DOCKER setup in the system."
    flag=$(docker ps | grep COMMAND | wc -l)
    if [ $flag -eq 1 ]
    then
        echo "INFO:Found a working docker setup"
    else
        error_exit
    fi
}

check_prerequisites
docker exec postgres /scripts/check.sh $1

if [ $? -ne 0 ]
then
   echo "ERROR:Found errors in the execution"
   exit 1
fi

exit 0