# Infrastructure
## Build
```
make build
```
## Run
Before running any Terraform commands, please set the AWS credentials appropriately:
```
export AWS_ACCESS_KEY_ID=<INSERT ACCESS KEY ID>
export AWS_SECRET_ACCESS_KEY=<INSERT SECRET ACCESS KEY>
```

Additionally, please set the following environment variables:
```
export ENVIRONMENT=<INSERT ENVIRONMENT NAME: dev | prd>
```

### Plan
```
make plan
```
### Deploy
```
make deploy
```
### Destroy
:warning: CAUTION :warning:
```
make destroy
```