#!/bin/sh

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'

sleep 2

kubectl port-forward -n gitlab svc/gitlab-webservice-default 8080:8181