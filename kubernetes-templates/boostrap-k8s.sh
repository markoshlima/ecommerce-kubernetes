#!/bin/sh

kubectl apply -f istio-ingressgateway.yaml

#cliente
kubectl apply -f cliente-k8s/cliente-k8s-deployment.yaml
kubectl apply -f cliente-k8s/cliente-k8s-service.yaml
kubectl apply -f cliente-k8s/cliente-k8s-virtualservice.yaml

#endereco
kubectl apply -f endereco-k8s/endereco-k8s-deployment.yaml
kubectl apply -f endereco-k8s/endereco-k8s-service.yaml
kubectl apply -f endereco-k8s/endereco-k8s-virtualservice.yaml

#produto
kubectl apply -f produto-k8s/produto-k8s-deployment.yaml
kubectl apply -f produto-k8s/produto-k8s-service.yaml
kubectl apply -f produto-k8s/produto-k8s-virtualservice.yaml

#compra
kubectl apply -f compra-k8s/compra-k8s-deployment.yaml
kubectl apply -f compra-k8s/compra-k8s-service.yaml
kubectl apply -f compra-k8s/compra-k8s-virtualservice.yaml

#facade
kubectl apply -f facade-k8s/facade-k8s-deployment.yaml
kubectl apply -f facade-k8s/facade-k8s-service.yaml
kubectl apply -f facade-k8s/facade-k8s-virtualservice.yaml

#front
kubectl apply -f front-k8s/front-k8s-deployment.yaml
kubectl apply -f front-k8s/front-k8s-service.yaml
kubectl apply -f front-k8s/front-k8s-virtualservice.yaml

minikube tunnel

#expose outside from localhost
#kubectl port-forward svc/istio-ingressgateway 15500:80 -n istio-system --address='0.0.0.0'
#kubectl port-forward svc/kiali 20002:20001 -n istio-system --address='0.0.0.0'