#!/bin/sh

INTERFACE=$(ip route | grep default | awk '{print $5}')

while [ ! -f /vagrant/node-token ]; do
    echo "Waiting for node-token..."
    sleep 3
done

curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface=enp0s3" K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$(sudo cat /vagrant/node-token) sh -
sleep 10
