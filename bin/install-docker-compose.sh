#!/bin/bash

# docker-compose-install-or-update.sh
# Installs or updates Docker Compose to the latest release from GitHub

set -e
 
echo "Checking latest version of Docker Compose..."

# Fetch the latest release tag from GitHub
LATEST_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

if [ -z "$LATEST_VERSION" ]; then
  echo "Failed to fetch latest Docker Compose version."
  exit 1
fi

echo "Latest version is: $LATEST_VERSION"

# Determine installed version
if command -v docker-compose >/dev/null 2>&1; then
  INSTALLED_VERSION=$(docker-compose --version | grep -oP '\d+\.\d+\.\d+')
  echo "Installed version is: $INSTALLED_VERSION"
else
  INSTALLED_VERSION=""
  echo "Docker Compose is not installed."
fi

# Compare versions
if [ "$LATEST_VERSION" == "$INSTALLED_VERSION" ]; then
  echo "Docker Compose is already up to date."
  exit 0
fi

# Download and install
DESTINATION=/usr/local/bin/docker-compose

echo "Downloading Docker Compose $LATEST_VERSION..."
sudo curl -L "https://github.com/docker/compose/releases/download/${LATEST_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o $DESTINATION

# Make executable
sudo chmod +x $DESTINATION

# Verify install
echo "Docker Compose $(docker-compose --version) installed successfully."
