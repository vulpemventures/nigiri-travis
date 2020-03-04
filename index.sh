#!/usr/bin/env bash

set -e
set -u
set -o pipefail

##/=====================================\
##|    Creating directories     |
##\=====================================/
mkdir -p config liquid-config
chmod -R 755 .

 
##/=====================================\
##|    Download conf files   |
##\=====================================/
curl -o ./config/bitcoin.conf -sL https://raw.githubusercontent.com/vulpemventures/nigiri-travis/master/bitcoin.conf
curl -o ./liquid-config/elements.conf -sL https://raw.githubusercontent.com/vulpemventures/nigiri-travis/master/elements.conf

##/=====================================\
##|    Download compose   |
##\=====================================/
curl -o docker-compose.yml -sL https://raw.githubusercontent.com/vulpemventures/nigiri-travis/master/docker-compose.yml

