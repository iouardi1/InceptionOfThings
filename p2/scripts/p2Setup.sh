#!/bin/sh
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--flannel-iface enp0s3" sh -
sleep 20

kubectl apply -f /vagrant/app1.yaml
kubectl apply -f /vagrant/app2.yaml
kubectl apply -f /vagrant/app3.yaml
kubectl apply -f /vagrant/ingress.yaml --validate=false