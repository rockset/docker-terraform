#!/bin/sh

set -e

if [ -n "${TERRAFORM_DIR}" ]; then
  cd "${TERRAFORM_DIR}" || exit 1
fi

/aws-sm-env terraform init

/aws-sm-env "$@"
