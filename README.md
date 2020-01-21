# docker-terraform

Builds a docker container with [terraform](https://www.terraform.io) 
and [aws-sm-env](https://github.com/rockset/aws-sm-env) in it, so
the container can be used as a build step.

E.g. invoke it with
```
docker run --rm \
  -v "$(pwd):/terraform" \
  -e "AWS_REGION=$(aws configure get region)" \
  -e "AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)" \
  -e "AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)" \
  -e "SECRETS_MANAGER_PATH=packer/buildkite" \
  rockset/terraform terraform plan
```
