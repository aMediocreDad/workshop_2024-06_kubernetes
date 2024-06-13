# Kubernetes Workshop - 2025-03

In this workshop we'll learn about Kubernetes and how to deploy applications on it. We will also cover ArgoCD and how to deploy applications using GitOps, as well as Helm and how Helm Charts work.

## Resources

### Containerization
- Full Guide: https://www.freecodecamp.org/news/a-beginner-friendly-introduction-to-containers-vms-and-docker-79a9e3e119b

### Minikube
- Minikube guide: https://kubernetes.io/docs/tutorials/hello-minikube/

### Kubernetes Docs
- About Pods: https://kubernetes.io/docs/concepts/workloads/pods/
- About Deployments: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
- About Services: https://kubernetes.io/docs/concepts/services-networking/service/
- About ConfigMaps: https://kubernetes.io/docs/concepts/configuration/configmap/
- About Secrets: https://kubernetes.io/docs/concepts/configuration/secret/

### Helm Docs
- What is a chart: https://helm.sh/docs/topics/charts/
- How to write charts: https://helm.sh/docs/howto/charts_tips_and_tricks/
- Values: https://helm.sh/docs/chart_best_practices/values/

### ArgoCD Docs
- Setup and CLI: https://argo-cd.readthedocs.io/en/stable/getting_started/
- About Declarative Setups: https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/

### Terraform Docs
- Terraform Language (HCL): https://developer.hashicorp.com/terraform/language
- Providers: https://developer.hashicorp.com/terraform/language/providers
- Resources: https://developer.hashicorp.com/terraform/language/resources/syntax
- Variables: https://developer.hashicorp.com/terraform/language/values
- Modules: https://developer.hashicorp.com/terraform/language/modules

### YouTube
- 1-Hour Crash Course: https://www.youtube.com/watch?v=s_o8dwzRlu4
- 4-Hour Full Tutorial: https://www.youtube.com/watch?v=X48VuDVv0do
- Helm Course: https://www.youtube.com/watch?v=-ykwb1d0DXU
- ArgoCD Crash Course: https://www.youtube.com/watch?v=MeU5_k9ssrs
- ArgoCD Tutorial: https://www.youtube.com/watch?v=zGndgdGa1Tc
- GitOps: https://www.youtube.com/watch?v=f5EpcWp0THw
- Terraform Crash Course: https://www.youtube.com/watch?v=l5k1ai_GBDE
- Terraform Structuring: https://www.youtube.com/watch?v=nMVXs8VnrF4

## Introduction

This repository uses Devbox to provide a development environment for the workshop. You can install Devbox if you'd like from here: [Devbox](https://www.jetify.com/devbox/docs/installing_devbox/) (it's not required).

What you do need regardless of Devbox is `Docker` or `Podman`, `minikube`, and `kubectl`. You can learn about and install those tools by searching for them online.

## Getting Started

At the stage you are at, this is now essentially a boilerplate repository for an app and a db running on kubernetes using argocd, helm and terraform.

If you are looking to go step by step in setting up kubernetes and learning how to deploy applications on it, you should look through the commits, they are numbered by steps.

To set up the boilerplate, clone this repository and run the following commands:

```bash
# If you have devbox installed
devbox shell

# Inside the Devbox shell
minikube start
```

This will start a local kubernetes cluster using minikube. Next, you will need to build the app image inside the minikube cluster. You can do this by running the following

```bash
minikube image build -t app:latest app
```

Then you can cd into the terraform directory and follow the instructions in the [README.md](./terraform/README.md) file there.

```bash
cd terraform
```

Once you have completed the terraform setup, you should be able to access the app and argocd dashboard. You can find the argocd dashboard by running the following command:

```bash
# Print the admin password in the terminal
argocd admin initial-password -n argocd

# Open the argocd dashboard in the browser
# username: admin password: <password from the command above>
minikube service -n argocd argocd-server
```

Open the app in the browser by running the following command:

```bash
minikube service -n app app-service
```

You can visit the `/items/create` endpoint to create some items in the database.
Then visit the `/items/{id}` endpoint to view the item you created.

**That's it!**
