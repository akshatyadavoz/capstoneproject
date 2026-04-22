#!/bin/bash
set -e

cd /home/ubuntu/capstone

git fetch origin
git reset --hard origin/main

docker stop capstone-app || true
docker rm capstone-app || true

docker build -t capstone-app .
docker run -d --name capstone-app -p 80:5000 capstone-app
