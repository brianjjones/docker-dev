# Docker-dev
A simple dev setup using Docker that gives you a clean environment to develop and test in. To create new environments simply add a new Docker file with your needed distro, packages, and other settings.

## Features
- Allows testing of native code without contaminating your desktop
- Quickly get back to your initial setup by restarting the Docker image
- Try out new tools and plugins without worrying about causing havok you can't easily reverse

## Default Docker image features
- Tracks changes to the code and reloads the node.js server and updates the browser using nodemon and browser-sync respectively
- live_env has a shared volume so that any file you create or change on the docker image is saved on your local machine. This is handy when you are

## Setup : run the following
```
docker-compose -f docker-compose-devenv.yml build --build-arg username=YOURNAME base
docker-compose up
```
- Go to a browser tab and open localhost:3000 and localhost:3001

#### TODO
- Create service / script to read config.json and populate package.json scripts, docker-compose* and Dockerfile with correct values.