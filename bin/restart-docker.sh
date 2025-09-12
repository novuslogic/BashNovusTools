#!/bin/bash

# restart-docker.sh
# Restarts Docker service with logging

echo "Restarting Docker service..."

# Stop Docker
sudo systemctl stop docker
if [ $? -ne 0 ]; then
  echo "Failed to stop Docker"
  exit 1
fi

# Start Docker
sudo systemctl start docker
if [ $? -ne 0 ]; then
  echo "Failed to start Docker"
  exit 1
fi

echo "Docker service restarted successfully."
