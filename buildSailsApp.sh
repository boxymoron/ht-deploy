#! /bin/bash

cd /home/ec2-user/deploy/ht-sails-app

echo "Running RSYNC:"
rsync -Haz --exclude=".git" --exclude=".tmp" --exclude="documentation"  /home/sails/ht-sails-app/ .

echo "Building Dockerfile"
DOCKER_BUILDKIT=1 docker build -t hero-traveler .

echo "Tagging build"
docker tag hero-traveler:latest 464827642642.dkr.ecr.us-east-1.amazonaws.com/hero-traveler:latest

echo "Authenticating with aws ECR repo:"
$(aws ecr get-login --no-include-email --region us-east-1)

echo "Pushing image to repo"
docker push 464827642642.dkr.ecr.us-east-1.amazonaws.com/hero-traveler:latest

cd /home/ec2-user/deploy
