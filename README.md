# AWS Assume Role

This is a small script to easily assume a specific AWS IAM Role. It allows you to write (shell) scripts without fiddling with `sts assume-role` functionality.

## Configuration

The `AWS_SECRET_ACCESS_KEY`, `AWS_ACCESS_KEY_ID`, and `AWS_REGION` environment variables must be set.

## Usage

Supply source and destination URL endpoints via Docker as follows:

    eval $(docker run -it --rm --env-file <(env | grep AWS_) maikelmertens/aws-assume-role:latest ROLE_ARN [ROLE_SESSION_NAME])

The `ROLE_ARN` needs to be the ARN of the AWS IAM Role to assume. E.g. `arn:aws:iam::1234567890123:role/CrossAccountRole`.

The optional `ROLE_SESSION_NAME` can be anything you want to specify as the session name of the role switch. E.g. `my-switcher`. The session name will be appended to the STS context taken from the AWS IAM Role, in this example you will end up with the following STS ARN: `arn:aws:sts::1234567890123:assumed-role/CrossAccountRole/my-switcher`

Because you add `eval` to the command, the output generated by the Docker container will be evaluated in your current shell and you will be able to use the new AWS environment variables immediately.

## Updating Policy

This Docker image will be automatically refreshed every week, hence you will have the latest updated version of the Docker image available anytime.