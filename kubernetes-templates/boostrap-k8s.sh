#!/bin/sh
#Appling Deployments
kubectl apply -f cliente-k8s/cliente-k8s-deployment.yaml
kubectl apply -f endereco-k8s/endereco-k8s-deployment.yaml
kubectl apply -f produto-k8s/produto-k8s-deployment.yaml
kubectl apply -f compra-k8s/compra-k8s-deployment.yaml
kubectl apply -f facade-k8s/facade-k8s-deployment.yaml
kubectl apply -f front-k8s/front-k8s-deployment.yaml
#Appling Services
kubectl apply -f cliente-k8s/cliente-k8s-service.yaml
kubectl apply -f endereco-k8s/endereco-k8s-service.yaml
kubectl apply -f produto-k8s/produto-k8s-service.yaml
kubectl apply -f compra-k8s/compra-k8s-service.yaml
kubectl apply -f facade-k8s/facade-k8s-service.yaml
kubectl apply -f front-k8s/front-k8s-service.yaml

minikube tunnel