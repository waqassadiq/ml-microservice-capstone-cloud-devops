#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build . --tag qasibeat/capstonejenkinskubernetiesbuild
# Step 2: 
# List docker images
docker image ls
# Step 3: 
# Run flask app
#sudo docker run --name qasibeat/capstonejenkinskubernetiesbuild -p 8000:80 qasibeat/project4attempt2
#i will be running it on kuberneties cluster