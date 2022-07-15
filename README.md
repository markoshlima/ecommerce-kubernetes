# **Introduction**

Ecommerce Kubernetes consists in testing about AWS Elastic Container Service for Kubernetes (EKS). It is about create some applications with different languages and communicate throught 'rest' procotol inside a Kubernetes network and also testing a service mesh layer throught this architecture and its benefits.

# **Pre-requisites tools version (or newer)**
- docker 20.10
- minikube 1.25
- kubectl 1.24
- eksclt 0.105
- istioctl 1.14

# **Infraestructure Architecture**

- All resources is inside a VPC in sa-east-1 (São Paulo) region.
- Route Table to route trafic between public and private using a NAT Gateway.
- Three private and Three public subnet in Three distinct availibility zones for high disponibility around the containers.

![alt text](https://raw.githubusercontent.com/markoshlima/ecommerce-kubernetes/master/docs/Infraestructure%20Architecture.png)

# **Solution Architecture**

In this scenario, was create four applications with especialized microservice information, such as customer, addresses, products and orders. There are two other microservice called facade, like a design patter facade, the objetive is to encapsulate the complexity about reading lots of especialized services into only one, or, in other ways, as we can see, there is a front end consuming this microservice, we can call back for front (BFF) too.
All tags/images was uploaded inside Elastic Container Registry (ECR) and to reach into the services was created a application load balancer.
The docker/kubernetes microservices was made available as follows:

- endereço-k8s: `port:5001`
- produto-k8s: `port:5002`
- compra-k8s: `port:5003`
- cliente-k8s: `port:5004`
- facade-k8s: `port:5005`
- front-k8s: `port:5006`

![alt text](https://raw.githubusercontent.com/markoshlima/ecommerce-kubernetes/master/docs/Solution%20Architecture.png)

What it was observed, is Kubernetes can manager very well all containers and create a layer with a lot of features like balancer, addresses alias of microservice, high available, managing replicas of PODS and so on. And without counting the amount open services that is possible to integrate with kubernetes. It was observed too, that managing containers without an orchestrator, we can create a lot of points of failures and we lost all capabilities above mentioned.

# Result

As a result of all kubernetes configuration working with 6 PODs. It had the following frontend result.

![alt text](https://raw.githubusercontent.com/markoshlima/ecommerce-kubernetes/master/docs/front-output.png)

# Service Mesh
Modern applications are typically architected as distributed collections of microservices, with each collection of microservices performing some discrete business function. A service mesh is a dedicated infrastructure layer that you can add to your applications. It allows you to transparently add capabilities like observability, traffic management, and security, without adding them to your own code. The term “service mesh” describes both the type of software you use to implement this pattern, and the security or network domain that is created when you use that software. (Istio).
It could be observed a quite and simpl way to dispose and create a service mesh layer with istio whereas it can implement an observability, secutiry and traffic shifting very easy, the images bellow is the result from istio service mesh implementation in this microservices architecture showed in Kiali Dashboard.

![alt text](https://raw.githubusercontent.com/markoshlima/ecommerce-kubernetes/master/docs/servicemesh1.png)

![alt text](https://raw.githubusercontent.com/markoshlima/ecommerce-kubernetes/master/docs/servicemesh2.png)

# Addition Information & Setup

The project is for lab and studies, it is not operating so as not to keep costs in production. That's a reason not existing a Continuos Develivy implemented too.

To setup the environment:
- Inside folder /IaaC there is the template used to create all infraestructure, it is possible to use with cloudformation or run the following commando with AWS CLI:
  `eksctl create cluster --name my-cluster --region region-code --fargate`
  This commando create a vpc, 3 private, 3 publics subnets, route tables, internet gateway, NAT gateway, ELB, security groups, policies and roles and everything is needed to run this application.
- Create all permissions needed: https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazonelastickubernetesservice.html
- Publish all container images inside ECR
- Change the URI to these new containers images inside folder /kubernetes-tamplates, inside all deployment.yaml files
- Run `./bootstrap-k8s.sh`
- This script will create all namespace and apply all deployment, services, gateways and virtualservices inside Kubernetes cluster
- Also run Kubernetes dashboard for easier view and manager: https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
- And Kiali Dashboard to visualize service mesh microservices implementation:  `istio dashboard kiali`
- If running K8s on localhost, change environment to build docker images:
    - eval $(minikube docker-env) #kubernetes env
    - eval $(minikube docker-env -u) #localhost env
  