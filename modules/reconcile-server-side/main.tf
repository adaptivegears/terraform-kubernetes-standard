resource "kubectl_manifest" "p0" {
  for_each          = data.kustomization_build.this.ids_prio[0]
  server_side_apply = true
  yaml_body         = data.kustomization_build.this.manifests[each.value]
  wait              = true
}

resource "kubectl_manifest" "p1" {
  for_each          = setunion(data.kustomization_build.this.ids_prio[1], data.kustomization_build.this.ids_prio[2])
  server_side_apply = true
  yaml_body         = data.kustomization_build.this.manifests[each.value]
  wait              = true
  depends_on        = [kubectl_manifest.p0]
}
