terraform {
  backend "kubernetes" {
    namespace     = "kube-system"
    secret_suffix = "reconcile-server-side"
  }
}
