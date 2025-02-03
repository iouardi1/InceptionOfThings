#!/bin/sh

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'

kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode > ../argocdPass

kubectl apply -f ../application.yaml -n argocd