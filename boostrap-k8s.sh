#!/bin/sh
#Creating namespaces
kubectl create namespace cliente-k8s
kubectl create namespace endereco-k8s
kubectl create namespace produto-k8s
kubectl create namespace compra-k8s
kubectl create namespace facade-k8s
#Appling Deployments
kubectl apply -f cliente-k8s-deployment.yaml
kubectl apply -f endereco-k8s-deployment.yaml
kubectl apply -f produto-k8s-deployment.yaml
kubectl apply -f compra-k8s-deployment.yaml
kubectl apply -f facade-k8s-deployment.yaml
#Appling Services
kubectl apply -f cliente-k8s-service.yaml
kubectl apply -f endereco-k8s-service.yaml
kubectl apply -f produto-k8s-service.yaml
kubectl apply -f compra-k8s-service.yaml
kubectl apply -f facade-k8s-service.yaml
