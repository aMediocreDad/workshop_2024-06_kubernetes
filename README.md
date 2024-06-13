# Kubernetes Workshop - 2025-03

In this workshop we'll learn about Kubernetes and how to deploy applications on it. We will also cover ArgoCD and how to deploy applications using GitOps, as well as Helm and how Helm Charts work.

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
