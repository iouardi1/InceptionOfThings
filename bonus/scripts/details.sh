#!/bin/sh

kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode > ./argoPass

sleep 2

kubectl get secret -n gitlab gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode > ./gitlabPass