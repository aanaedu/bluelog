#!/usr/bin/env bash

# Step 1:
# Build image and add a descriptive tag
docker build --tag=udacitycapstoneproject .

# Step 2: 
# List docker images
docker images ls

# Step 3: 
# Run flask app
docker run -d -p 8000:80 udacitycapstoneproject