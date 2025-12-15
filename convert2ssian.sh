#!/usr/bin/env bash
#############################################################
# 
# Author:       @sboistel
# Owner:	    @
# Topic:        Topic
# Date:         DATE
# 
#############################################################

# COLORS
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# VAR
md_file="$1"
diname="md2atlassian:v1.0"

# FUNCTIONS
function docker_ckeck () {
    if ! [ -x "$(command -v docker)" ]; then
        echo 'Error: docker is not installed.' >&2
        exit 1
    fi
    docker image inspect ${diname} > /dev/null 2>&1 || {
        echo -e "${YELLOW}Docker image ${diname} not found. Building it now...${NC}"
        cd "$(dirname "$0")" || exit 1
        docker build -t ${diname} .
        if [ $? -ne 0 ]; then
            echo 'Error: Failed to build the Docker image.' >&2
            exit 1
        fi
    }
}
function run_container () {
    docker run --rm -v "$(pwd)":/data ${diname} "$md_file"
}

# MAIN
counter=0
while [ -z "$md_file" ]; do
    if [ $counter -gt 1 ]; then
        exit 1
    fi
    echo -e "${YELLOW}No arguments supplied. Please provide the markdown file to convert.${NC}"
    read -rp "Please enter the markdown file to convert: " md_file
    counter=$((counter + 1))
done

docker_ckeck
run_container "$md_file"
