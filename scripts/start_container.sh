#!/bin/bash
imagetag=$(aws ssm get-parameter --name /CodeBuild/imagetag --with-decryption | jq -r .Parameter.Value)
docker service update --force --image 224013136264.dkr.ecr.eu-central-1.amazonaws.com/deadsen/devops-test-task:$imagetag chatbots-app_chatbots-app
