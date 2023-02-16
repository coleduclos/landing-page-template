#!/bin/sh

SOURCE_DIR=./src
SERVICE_NAME=$(basename $(pwd))
ZIP_FILE_NAME="${SERVICE_NAME}.zip"

echo "Zipping app to $ZIP_FILE_NAME..."
zip -r $ZIP_FILE_NAME ${SOURCE_DIR}/*