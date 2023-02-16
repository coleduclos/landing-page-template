#!/bin/sh

DOCKER_CONTAINER_NAME=landingpage-infra
DOCKER_IMAGE_NAME=coleduclos/landingpage-infra:test

print_usage () {
    echo "Usage:"
    echo "./run.sh -i <docker image name> <docker args>"
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

shift "$((OPTIND-1))"

# Stop and remove any running Docker containers with the same name
docker kill ${DOCKER_CONTAINER_NAME}
docker rm ${DOCKER_CONTAINER_NAME}

echo "Running container with image: ${DOCKER_IMAGE_NAME}"
docker run \
    --name "${DOCKER_CONTAINER_NAME}" \
    --env AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
    --env AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
    --env AWS_SESSION_TOKEN="${AWS_SESSION_TOKEN}" \
    --env ENVIRONMENT="${ENVIRONMENT}" \
    $DOCKER_IMAGE_NAME \
    $@
