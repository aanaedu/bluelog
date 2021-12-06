#!/usr/bin/env bash

# This runs docker hub image with kubernetes

# Your Docker ID/path
dockerpath="061770600068.dkr.ecr.us-west-2.amazonaws.com/udacitycapstoneproject:latest"
echo "Docker ID and Image: $dockerpath"

# Run the Docker Hub container with kubernetes
kubectl run udacitycapstoneproject\
    --image=$dockerpath\
    --port=80 --labels app=udacitycapstoneproject

# List kubernetes pods
kubectl get pods

# Forward the container port to a host
kubectl port-forward udacitycapstoneproject 8000:80
