locals {
  namespace = "app"
}


# The main application
resource "kubernetes_manifest" "app" {

  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "app"
      namespace = "argocd"
    }
    spec = {
      project = "default"
      source = {
        repoURL        = "https://github.com/aMediocreDad/workshop_2024-06_kubernetes.git"
        targetRevision = "HEAD"
        path           = "app/config"
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = local.namespace
      }
      syncPolicy = {
        syncOptions = ["CreateNamespace=true"]
        automated = {
          prune    = true
          selfHeal = true
        }
      }
    }
  }
}

# Postgress database using argocd
resource "kubernetes_manifest" "postgres" {

  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "postgres"
      namespace = "argocd"
    }
    spec = {
      project = "default"
      sources = [
        {
          repoURL        = "registry-1.docker.io/bitnamicharts"
          targetRevision = "15.5.5"
          chart          = "postgresql"
          helm = {
            valueFiles = ["$values/values/db.yaml"]
          }
        },
        {
          repoURL        = "https://github.com/aMediocreDad/workshop_2024-06_kubernetes.git"
          targetRevision = "HEAD"
          ref            = "values"
        }
      ]
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = local.namespace
      }
      syncPolicy = {
        syncOptions = ["CreateNamespace=true"]
        automated = {
          prune    = true
          selfHeal = true
        }
      }
    }
  }
}

