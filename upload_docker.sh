#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=qasibeat/capstonejenkinskubernetiesbuild

# Step 2:  
# Authenticate & tag
# i have authenticated dockeer on ec2 instance
docker login --username=qasibeat
#sudo docker login
docker tag $dockerpath $dockerpath:latest
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
sudo docker push $dockerpath