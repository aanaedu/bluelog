#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Create dockerpath
dockerpath="061770600068.dkr.ecr.us-west-2.amazonaws.com/udacitycapstoneproject:latest"

# Authenticate & tag
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 061770600068.dkr.ecr.us-west-2.amazonaws.com
echo "Docker ID and Image: $dockerpath"
docker tag udacitycapstoneproject:latest $dockerpath

# Push image to a docker repository
docker push $dockerpath