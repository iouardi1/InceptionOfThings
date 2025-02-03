#!/bin/sh

# INTERFACE=$(ip route | grep default | awk '{print $5}')

curl -sfL https://get.k3s.io | sudo sh -s -  server \
    --flannel-iface=eth1 \
    --write-kubeconfig-mode=644 \
    --token=vagrant-k3s-token \
    --node-ip="192.168.56.110"

sleep 10


NODE_TOKEN="/var/lib/rancher/k3s/server/node-token"
while [ ! -e ${NODE_TOKEN} ]
    do
        sleep 2
    done

sudo apt-get update -y
sudo apt-get install -y net-tools

# sudo cat ${NODE_TOKEN}
sudo cp ${NODE_TOKEN} /vagrant/
KUBE_CONFIG="/etc/rancher/k3s/k3s.yaml"
sudo cp ${KUBE_CONFIG} /vagrant/

sudo chmod 644 /etc/rancher/k3s/k3s.yaml

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml