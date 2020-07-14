

The file named: Dockerfile in this directory corresponds to the base image "amazon-linux-nodejs12". https://console.aws.amazon.com/ecr/repositories/amazon-linux-nodejs12/?region=us-east-1
The directory ht-sails-app is rsynced from /home/sails/ht-sails-app and is used to create the image 'hero-traveler', which uses the base image above. This is the image that should be used for production.

The file /home/sails/ht-sails-app/Dockerfile is the file that should be modified (in-situ) and committed to git
