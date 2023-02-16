#!/bin/sh

if [ -z "${ENVIRONMENT}" ]; then
    ENVIRONMENT="dev"
    echo "ENVIRONMENT not set. Setting to default: ${ENVIRONMENT}"
fi

# if [ -z "${SOURCE_DIR}" ]; then
#     SOURCE_DIR="./"
#     echo "SOURCE_DIR not set. Setting to default: ${SOURCE_DIR}"
# fi

terraform init \
    -backend=true \
    -backend-config=./variables/${ENVIRONMENT}.backend.tfvars \
    || { echo "ERROR: Could not Initialize Terraform. Exiting..."; exit 1; }