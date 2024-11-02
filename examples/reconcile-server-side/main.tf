module "managed_resources" {
  source = "adaptivegears/standard/kubernetes//modules/reconcile-server-side"

  path = "${path.module}/k8s"
}
