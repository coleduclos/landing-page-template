# mobile-app-landing-page-template
GitHub template for creating a mobile app landing page

## Usage

### Create git repo

Use this github repo as a template when creating your own git repo.

### Create AWS infrastructure

Before you can upload your landing page, you must create the AWS infrastructure. Please read the documentation [here](./infrastructure/README.md). 

### HTML Code

It's typically best practice to build an immutable (versioned) artifact that contains your code changes and store it externally in case you need to revert changes in the future. The steps below describe how to do this with a website.

#### Prerequisites

Set the following environment variables

```
export APPLICATION_ID="<INSERT A UNIQUE APPLICATION ID>"
export ARTIFACT_S3_BUCKET="<INSERT NAME OF S3 BUCKET TO STORE ARTIFACT>"
export ARTIFACT_S3_VERSION="<INSERT ARTIFACT VERSION HERE>"
export WEBSITE_S3_BUCKET="<INSERT NAME OF S3 BUCKET HOSTING WEBSITE>"
```

#### Update the HTML template

Open the [index.html](./src/index.html) file in any text editor or IDE and update the placeholder values. Examples: title, description, images, etc.

#### Build a HTML artifact (zip file)

Build an immutable artifact with all of your website files. 

```
make build
```

This will result in a zip file.

#### Push the versioned artifact to S3

Push this (versioned) artifact to an external location. 

```
make push
```

This will push to an S3 bucket with the key: `<APPLICATION_ID>/<SERVICE_NAME>/artifacts/<ARTIFACT_S3_VERSION>/<ARTIFACT_FILE_NAME>`

#### Deploy the landing page

Download the (versioned) artifact and deploy website.

```
make deploy
```

This will download the zip file from the external source, unzip it, and deploy to the S3 bucket meant to host the website.

## Built with

* AWS
* Terraform
* HTML
* Bootstrap
