#!/bin/sh

helm install gitlab gitlab/gitlab --namespace gitlab -f ./manifest/helm-config.yaml