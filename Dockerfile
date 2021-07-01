FROM alpine

ARG AWS_SM_ENV_VERSION=0.1.1

RUN apk update && apk add ca-certificates curl git libc6-compat && update-ca-certificates

RUN curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sh

RUN tfswitch 0.13.5 && \
    tfswitch 0.13.7 && \
    tfswitch 1.0.0 && \
    tfswitch 1.0.1

RUN wget https://github.com/rockset/aws-sm-env/releases/download/v${AWS_SM_ENV_VERSION}/aws-sm-env && \
    chmod 755 /aws-sm-env

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

RUN mkdir /terraform
WORKDIR /terraform

ENTRYPOINT ["/entrypoint.sh"]
