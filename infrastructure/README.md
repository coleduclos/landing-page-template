# Infrastructure
## Build
```
./build.sh
```
## Run
Before running any Terraform commands, please set the credentials appropriately:
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
./run.sh plan
```
### Apply
```
./run.sh apply -auto-approve
```
### Destroy
:warning:CAUTION:warning:
```
./run.sh destroy
```