#!/bin/sh

kubectl get all -n argocd -o wide

sleep 1

kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode > ./argoPass