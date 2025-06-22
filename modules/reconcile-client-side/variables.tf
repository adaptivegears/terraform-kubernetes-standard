variable "kustomization" {
  description = "The path to the module containing Kustomize configurations."
  type        = string
  default     = "."
}

variable "helm_enable" {
  description = "Enable Helm support in Kustomize."
  type        = bool
  default     = true
}

variable "helm_path" {
  description = "The path to the Helm chart directory."
  type        = string
  default     = "helm"
}
