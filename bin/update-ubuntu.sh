#!/bin/bash

sudo apt-get update 

sudo NEEDRESTART_SUSPEND=1 apt-get upgrade --yes
sudo NEEDRESTART_SUSPEND=1 apt-get dist-upgrade --yes
