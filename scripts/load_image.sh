#!/bin/bash
imagetag=$(aws ssm get-parameter --name /CodeBuild/imagetag --with-decryption | jq -r .Parameter.Value)
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 224013136264.dkr.ecr.eu-central-1.amazonaws.com
docker pull 224013136264.dkr.ecr.eu-central-1.amazonaws.com/deadsen/devops-test-task:$imagetag
