#!/bin/bash

# Add your user to docker group
sudo usermod -aG docker $USER

# Refresh group membership (log out and back in, or run:)
newgrp docker
