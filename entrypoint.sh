#!/bin/sh

if [ -n "${TERRAFORM_DIR}" ]; then
  cd "${TERRAFORM_DIR}" || exit 1
fi

# run terraform init if it hasn't been called yet
if [ ! -d ".terraform" ]; then
  /aws-sm-env terraform init
fi

/aws-sm-env "$@"
