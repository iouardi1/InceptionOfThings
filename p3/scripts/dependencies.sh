#!/bin/sh

curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

sleep 5

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl