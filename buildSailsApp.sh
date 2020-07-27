#! /bin/bash

git_branch=$(sudo su -c 'git -C /home/sails/ht-sails-app rev-parse --abbrev-ref HEAD')
git_commit_id="$(sudo su -c 'git -C /home/sails/ht-sails-app log --format="%H" -n 1' sails)"

echo "Running RSYNC:"
rsync -Haz --exclude=".git" --exclude=".tmp" --exclude="documentation"  /home/sails/ht-sails-app/ ./ht-sails-app

touch ./ht-sails-app/gitinfo
printf "${git_branch}" > ./ht-sails-app/git_branch
printf "${git_commit_id}" > ./ht-sails-app/git_commit_id

printf "Git branch: "
cat ./ht-sails-app/git_branch
printf "\nGit commit id: "
cat ./ht-sails-app/git_commit_id
printf "\n"

echo "Building Dockerfile"
DOCKER_BUILDKIT=1 docker build -t hero-traveler ./ht-sails-app

echo "Tagging build"
docker tag hero-traveler:latest 464827642642.dkr.ecr.us-east-1.amazonaws.com/hero-traveler:latest

echo "Authenticating with aws ECR repo:"
$(aws ecr get-login --no-include-email --region us-east-1)

echo "Pushing image to repo"
docker push 464827642642.dkr.ecr.us-east-1.amazonaws.com/hero-traveler:latest

