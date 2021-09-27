# docker-tflint

## alpine container with bash, tflint, ca-certs and jq baked in

This repository contains the files for producing a docker image which has `tflint` installed. This is mainly used in DataWorks by AWS Concourse to ensure our terraform code is linted before pushed.

After cloning this repo, please run:  
`make bootstrap`

## CI

There is a GitHub Actions pipeline in the DWP organisation which builds and deploys the image to docker hub. The image is then mirrored to ECS via the [mirror images pipeline](https://ci.dataworks.dwp.gov.uk/teams/dataworks/pipelines/mirror-docker-images) in AWS Concourse.

There is also a pipeline for this repo which creates the ECS repository in mgmt and mgmt-dev.

## Local building

When making changes, these should always be tested locally first by running this from the root:

docker run -it $(docker build -q .)
This will build and run a local version of this image, which you can then go in to and check it has the relevant packages installed.
