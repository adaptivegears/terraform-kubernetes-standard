data "kustomization_overlay" "this" {
  resources = [
    var.kustomization
  ]
}
