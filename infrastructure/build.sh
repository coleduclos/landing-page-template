#!/bin/sh

DOCKER_IMAGE_NAME=coleduclos/landingpage-infra:test

print_usage () {
    echo "Usage:"
    echo "./build.sh -i <docker image name>"
}

while getopts ":hi:" opt; do
    case "${opt}" in
        h)
            print_usage
            exit 0
            ;;
        i)
            DOCKER_IMAGE_NAME=${OPTARG}
            ;;
        \? )
            echo "Invalid Option: -$OPTARG" 1>&2
            print_usage
            exit 1
            ;;
    esac
done

echo "Executing build.sh..."

echo "Building Docker image: ${DOCKER_IMAGE_NAME}"
docker build -t "${DOCKER_IMAGE_NAME}" .