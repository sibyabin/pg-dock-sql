#!/bin/bash
set -e
set -a

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

set +a

error_exit() {
    echo "${RED}ERROR:Could not find a working docker setup. Please refer https://docs.docker.com/engine/install/${NC}"
    exit 1
}

error() {
    echo "${RED}ERROR: Failed to run commands.Please check logs for more information${NC}"
    exit 1
}

check_prerequisites() {
    echo "${GREEN}INFO:Searching for a working DOCKER setup in the system.${NC}"
    flag=$(docker ps | grep COMMAND | wc -l)
    if [ $flag -eq 1 ]
    then
        echo "${GREEN}INFO:Found a working docker setup${NC}"
    else
        error_exit
    fi
}

print_expected_solution() {
    docker exec postgres /scripts/check.sh $1
    if [ $? -ne 0 ] 
    then
        error
    fi
}

run_tests() {
    docker exec postgres /scripts/run_tests.sh $1
    if [ $? -ne 0 ] 
    then
        error
    fi
}

echo "${BLUE}"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "                               START                                         "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "${NC}"

# check the pre-requisites (docker setup)
check_prerequisites

# Print the expected output and solution output to logs
print_expected_solution $1

# Run pre-defined tests (if any)
run_tests $1
echo "${BLUE}"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "                                END                                          "
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "${NC}"
exit 0