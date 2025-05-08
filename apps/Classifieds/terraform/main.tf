resource "kubernetes_namespace" "cl_ns" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "classifieds" {
  depends_on = [
    kubernetes_namespace.cl_ns,
  ]

  namespace = kubernetes_namespace.cl_ns.metadata[0].name

  name    = var.helm_release_name
  chart   = "../helm-chart"
  version = "0.1.0"

  # Additional settings
  cleanup_on_fail = true # default= false

  set {
    name  = "deployment.image.repository"
    value = var.docker_image_name
  }
  set {
    name  = "deployment.image.tag"
    value = var.docker_image_tag
  }
  set {
    name  = "deployment.envFromKeyVault[0].name"
    value = "ConnectionStringClassifieds"
  }
  set {
    name  = "deployment.envFromKeyVault[0].secretName"
    value = lower(data.azurerm_key_vault_secret.cl_cs_secret.name)
  }
  set {
    name  = "deployment.envFromKeyVault[1].name"
    value = "ConnectionStringTimeTracker"
  }
  set {
    name  = "deployment.envFromKeyVault[1].secretName"
    value = lower(data.azurerm_key_vault_secret.tt_cs_secret.name)
  }
}
