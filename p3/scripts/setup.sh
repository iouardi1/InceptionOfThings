#!/bin/sh

k3d cluster create p3

sleep 5

kubectl create namespace argocd

sleep 1

kubectl create namespace dev

sleep 2

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

