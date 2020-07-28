#! /bin/bash

docker run --network="host" -it --entrypoint /bin/sh hero-traveler

#From within container you can start sails:
DEBUG=false NODE_ENV=production AWS_S3_BUCKET=hero-traveler node --experimental-modules --max-old-space-size=2048 app.js --redis

#to exit, type exit
