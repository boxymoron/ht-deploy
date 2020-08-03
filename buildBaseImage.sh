#! /bin/bash
docker build -t amazon-linux-nodejs13 -f ./Dockerfile-amazon-linux-nodejs13 . && \

docker tag amazon-linux-nodejs13:latest 464827642642.dkr.ecr.us-east-1.amazonaws.com/amazon-linux-nodejs13:latest && \

$(aws ecr get-login --no-include-email --region us-east-1) && \

docker push 464827642642.dkr.ecr.us-east-1.amazonaws.com/amazon-linux-nodejs13:latest
