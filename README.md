## Hero Traveler - AWS ECS Deployment project

# This project is used to package up the Sails app for use in ECS

The file named: Dockerfile-amazon-linux-nodejs13 is used as the base image "amazon-linux-nodejs13" for the sails container.

The directory ./ht-sails-app is rsynced from /home/sails/ht-sails-app . It is used to create the image 'hero-traveler', which uses the base image above. This is the image that gets deployed ECS.

Changes to the Sails app's docker image are made in /home/sails/ht-sails-app/Dockerfile . This file should be modified in-situ and committed to git

# To test sails image in a container (with a bash prompt) run:

`./startContainer.sh`

#Then from within the container you can start Sails: 

`DEBUG=false NODE_ENV=production AWS_S3_BUCKET=hero-traveler node --experimental-modules app.js --redis`

#or to start with the postgres native bidings

`DEBUG=false NODE_ENV=production AWS_S3_BUCKET=hero-traveler NODE_PG_FORCE_NATIVE=true PGSSLMODE=disable node --experimental-modules app.js --redis`
