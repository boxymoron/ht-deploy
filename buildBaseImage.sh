#! /bin/bash
docker build -f ./Dockerfile-amazon-linux-nodejs12 . && \

docker tag amazon-linux-nodejs12:latest 464827642642.dkr.ecr.us-east-1.amazonaws.com/amazon-linux-nodejs12:latest && \

$(aws ecr get-login --no-include-email --region us-east-1) && \

docker push 464827642642.dkr.ecr.us-east-1.amazonaws.com/amazon-linux-nodejs12:latest
