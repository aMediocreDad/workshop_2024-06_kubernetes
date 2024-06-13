# READ THIS FIRST

> [!IMPORTANT]
> Due to an issue with the kubernetes provider we have to instantiate argocd **before** we can add any applications to it.
> See: <https://github.com/hashicorp/terraform-provider-kubernetes/issues/1367>

```bash
cd argocd
terraform init
terraform apply --auto-approve
```

Then you can run the main terraform script.

```bash
cd ../applications
terraform init
terraform apply --auto-approve
```
