module "managed_resources" {
  source = "adaptivegears/standard/kubernetes//modules/reconcile-client-side"

  path = "${path.module}/k8s"
}
