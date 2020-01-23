FROM alpine

ARG TERRAFORM_VERSION=0.12.19
ARG AWS_SM_ENV_VERSION=0.1.1

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin

RUN apk update && apk add ca-certificates git && update-ca-certificates

RUN wget https://github.com/rockset/aws-sm-env/releases/download/v${AWS_SM_ENV_VERSION}/aws-sm-env && \
    chmod 755 /aws-sm-env

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

RUN mkdir /terraform
WORKDIR /terraform

ENTRYPOINT ["/entrypoint.sh"]
