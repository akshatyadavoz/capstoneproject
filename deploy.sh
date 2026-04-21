#!/bin/bash
set -e

APP_NAME="capstone-app"
IMAGE_NAME="capstone-app:v1"

echo "Stopping old container if it exists..."
docker stop $APP_NAME || true
docker rm $APP_NAME || true

echo "Starting new container..."
docker build -t $IMAGE_NAME .
docker run -d --name $APP_NAME -p 5000:5000 $IMAGE_NAME

echo "Waiting for app..."
sleep 5

echo "Running health check..."
curl -f http://localhost:5000/health

echo "Deployment successful"
