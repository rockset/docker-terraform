#!/bin/sh

set -e

echo "TERRAFORM_DIR=${TERRAFORM_DIR}"
echo "AMI=${AMI}"

if [ -n "${TERRAFORM_DIR}" ]; then
  cd "${TERRAFORM_DIR}" || exit 1
fi

tfswitch

/aws-sm-env terraform init

/aws-sm-env "$@"
