data "kustomization_overlay" "this" {
  resources = [
    var.kustomization
  ]

  kustomize_options = {
    enable_helm = var.helm_enable
    helm_path   = var.helm_path
  }
}
