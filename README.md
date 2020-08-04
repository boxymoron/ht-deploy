# Hero Traveler - AWS ECS Deployment project

## This project is used to build and upload a Docker image to AWS ECR for use in AWS ECS

The file named: Dockerfile-amazon-linux-nodejs13 is used as the base image "amazon-linux-nodejs13" for the sails container. This image consists (as its name implies) of amazon-linux and nodejs version 13.

The directory ./ht-sails-app is rsynced from /home/sails/ht-sails-app . It is used to create the image 'hero-traveler', which uses the base image above. This is the image that gets deployed ECS.

Changes to the Sails app's docker image are made in /home/sails/ht-sails-app/Dockerfile . This file should be modified in-situ and committed to git.

## Log in to the development server via SSH:

`ssh -i herotraveler2.pem ec2-user@ec2-54-156-164-160.compute-1.amazonaws.com`

## Log in to sails user account:

`sudo su sails`

`cd ~/ht-sails-app`

The ht-sails-app directory is used as the source for the sails image. It is also used as the dev server's source (using the `development` branch) Whatever state this directory is in is what ultimately gets packaged up in the image. Typically you would checkout the `master` branch (production branch) to build the sails docker image.

## Checkout the master branch:

`git checkout master`

`git pull`

Make changes if necessary (to test stuff, etc).


## Now from the ec2-user account (on a different terminal):

`cd ~/deploy`

### To start the Docker service (optional):

`./startDocker.sh`

### To cleanup unused Docker images (optional):

`./docker-prune.sh`

This should be done periodically or the server might run out of disk space.

### To build the base image (optional):

`./buildBaseImage.sh`

This should not be necessary unless you are upgrading node, or really want to change something in the base image.

### To build the sails docker image:

`./buildSailsApp.sh`

Check the output to make sure the process was successful. You should see the new image in ECR: https://console.aws.amazon.com/ecr/repositories/hero-traveler/?region=us-east-1

## To test sails image locally (with a bash prompt) run:

`./startContainer.sh`

## Then from within the container you can start Sails: 

`DEBUG=false NODE_ENV=production AWS_S3_BUCKET=hero-traveler node --experimental-modules app.js --redis`

## or to start with the postgres native bidings

`DEBUG=false NODE_ENV=production AWS_S3_BUCKET=hero-traveler NODE_PG_FORCE_NATIVE=true PGSSLMODE=disable node --experimental-modules app.js --redis`

## The images are stored in AWS ECR: https://console.aws.amazon.com/ecr/repositories?region=us-east-1

## ECS Deployment

After building the Sails image above, go to the AWS CodePipeline project: https://console.aws.amazon.com/codesuite/codepipeline/pipelines/herotraveler2-pipeline/view?region=us-east-1

To start the deploment of the latest image click on the 'Release' button.


