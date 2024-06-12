resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "3.35.4"

  values = [file("values/argocd.yaml")]
}


# Thanks to an issue with the kubernetes provider we have to apply this after the creation of the argocd CRD above
# https://github.com/hashicorp/terraform-provider-kubernetes/issues/1367
# Run `terraform apply --auto-approve` waiting for it to run and then run it again with this section commented back in.

# resource "kubernetes_manifest" "app" {
#   manifest = {
#     apiVersion = "argoproj.io/v1alpha1"
#     kind       = "Application"
#     metadata = {
#       name      = "app"
#       namespace = "argocd"
#     }
#     spec = {
#       project = "default"
#       source = {
#         repoURL        = "https://github.com/aMediocreDad/workshop_2024-06_kubernetes.git"
#         targetRevision = "HEAD"
#         path           = "config"
#       }
#       destination = {
#         server    = "https://kubernetes.default.svc"
#         namespace = "default"
#       }
#       syncPolicy = {
#         automated = {
#           prune    = true
#           selfHeal = true
#         }
#       }
#     }
#   }
# }
