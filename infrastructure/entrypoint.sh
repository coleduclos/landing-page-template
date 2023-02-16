#!/bin/sh
if [ -z "${AWS_ACCESS_KEY_ID}" ]; then
    echo "Please set the AWS_ACCESS_KEY_ID environment variable."
    exit 1
fi

if [ -z "${AWS_SECRET_ACCESS_KEY}" ]; then
    echo "Please set the AWS_SECRET_ACCESS_KEY environment variable."
    exit 1
fi

if [ -z "${ENVIRONMENT}" ]; then
    export ENVIRONMENT="dev"
    echo "ENVIRONMENT not set. Setting to default: ${ENVIRONMENT}"
fi

./init.sh

terraform $@ \
    -var-file=./variables/${ENVIRONMENT}.tfvars