

The file named: Dockerfile-amazon-linux-nodejs12 in this directory corresponds to the base image "amazon-linux-nodejs12". https://console.aws.amazon.com/ecr/repositories/amazon-linux-nodejs12/?region=us-east-1

The directory ht-sails-app is rsynced from /home/sails/ht-sails-app and is used to create the image 'hero-traveler', which uses the base image above. This is the image that should be used for production.

The file /home/sails/ht-sails-app/Dockerfile is the file that should be modified (in-situ) and committed to git

To test the container (with bash):

docker run --network="host" -it --entrypoint /bin/sh hero-traveler

Then from within the container you can start Sails: DEBUG=false NODE_ENV=production AWS_S3_BUCKET=hero-traveler node --experimental-modules --max-old-space-size=2048 app.js --redis
