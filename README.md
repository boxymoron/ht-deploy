## Hero Traveler - AWS ECS Deployment project

# This project is used to build and upload a Docker image to AWS ECR for use in AWS ECS

The file named: Dockerfile-amazon-linux-nodejs13 is used as the base image "amazon-linux-nodejs13" for the sails container. This image consists (as its name implies) of amazon-linux and nodejs version 13.

The directory ./ht-sails-app is rsynced from /home/sails/ht-sails-app . It is used to create the image 'hero-traveler', which uses the base image above. This is the image that gets deployed ECS.

Changes to the Sails app's docker image are made in /home/sails/ht-sails-app/Dockerfile . This file should be modified in-situ and committed to git.

# Log in to the development server sails user account:

`sudo su sails`

`cd ~/ht-sails-app`

# Checkout the master branch:

`git checkout master`

`git pull`

`exit`

# now from the ec2-user account:

`cd deploy`

`./buildSailsApp.sh`

# To test sails image in a container (with a bash prompt) run:

`./startContainer.sh`

# Then from within the container you can start Sails: 

`DEBUG=false NODE_ENV=production AWS_S3_BUCKET=hero-traveler node --experimental-modules app.js --redis`

# or to start with the postgres native bidings

`DEBUG=false NODE_ENV=production AWS_S3_BUCKET=hero-traveler NODE_PG_FORCE_NATIVE=true PGSSLMODE=disable node --experimental-modules app.js --redis`

## The images are stored in AWS ECR:

https://console.aws.amazon.com/ecr/repositories?region=us-east-1

## ECS Deployment

After building the Sails image above, go to the AWS CodePipeline project: https://console.aws.amazon.com/codesuite/codepipeline/pipelines/herotraveler2-pipeline/view?region=us-east-1

To start the deploment of the latest image click on the 'Release' button.
