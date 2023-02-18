#!/bin/sh

# Deploys a front end artifact (zip file) to S3 by executing the following steps:
# 1. Downloading the zipped artifact from S3
# 2. Unzipping locally
# 3. Pushing the unzipped front end files to S3

if [ -z "$APPLICATION_ID" ]; then
    echo "Please set the APPLICATION_ID environment variable."
    exit 1
fi

if [ -z "$ARTIFACT_S3_BUCKET" ]; then
    echo "Please set the ARTIFACT_S3_BUCKET environment variable."
    exit 1
fi

if [ -z "$ARTIFACT_S3_VERSION" ]; then
    ARTIFACT_S3_VERSION="test"
    echo "WARNING: ARTIFACT_S3_VERSION environment variable is not set. Using default: ${ARTIFACT_S3_VERSION}."
fi

if [ -z "$WEBSITE_S3_BUCKET" ]; then
    echo "Please set the WEBSITE_S3_BUCKET environment variable."
    exit 1
fi

SERVICE_NAME=$(basename $(pwd))
ARTIFACT_FILE_NAME="${SERVICE_NAME}.zip"
ARTIFACT_S3_KEY="${APPLICATION_ID}/${SERVICE_NAME}/artifacts/${ARTIFACT_S3_VERSION}/${ARTIFACT_FILE_NAME}"
TEMP_DIR=./tmp

echo "Downloading the artifact locally..."
aws s3 cp s3://${ARTIFACT_S3_BUCKET}/${ARTIFACT_S3_KEY} ./ || { echo "ERROR! Failed to get artifact from S3." ; exit 1; }

echo "Unpacking artifact..."
unzip ${ARTIFACT_FILE_NAME} -d ${TEMP_DIR} || { echo "ERROR! Failed to unzip ${ARTIFACT_FILE_NAME}." ; exit 1; }

echo "The files below will be deployed to S3: "
ls -al ${TEMP_DIR}/src/ || { echo "ERROR! Failed to find ${TEMP_DIR}/build." ; exit 1; }

echo "Deploying web app to s3://${WEBSITE_S3_BUCKET}"
aws s3 sync ${TEMP_DIR}/src/ s3://${WEBSITE_S3_BUCKET}

echo "Cleaning up files..."
rm -rf ${TEMP_DIR}
rm ${ARTIFACT_FILE_NAME}