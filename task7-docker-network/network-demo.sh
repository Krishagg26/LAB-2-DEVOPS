#!/bin/bash
# Docker Network Lab Demonstration Script

echo "Creating custom bridge network..."
docker network create my-custom-network

echo "Running containers on custom network..."
docker run -d --name container1 --net my-custom-network nginx:latest sleep 300
docker run -d --name container2 --net my-custom-network nginx:latest sleep 300

echo "Inspecting container IP addresses..."
docker inspect container1 | grep IPAddress

echo "Cleaning up network resources..."
docker stop container1 container2
docker rm container1 container2
docker network rm my-custom-network
