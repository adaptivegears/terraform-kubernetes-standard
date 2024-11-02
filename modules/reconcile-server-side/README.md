# Reconcile Server-Side Module

The `reconcile-server-side` Terraform module manages Kubernetes resources using server-side apply with `kubectl`. It ensures that Kubernetes manifests are applied in the correct order with appropriate dependencies and wait conditions to maintain the desired state of your cluster.

## Features

- **Server-Side Apply**: Utilizes Kubernetes server-side apply for efficient resource management.
- **Resource Prioritization**: Handles multiple resource priorities to ensure proper ordering of deployments.
- **Dependencies Management**: Manages dependencies between resources to maintain deployment integrity.
- **Wait Conditions**: Configurable wait conditions to ensure resources are fully applied before proceeding.

## Usage

```hcl
module "managed_resources" {
  source = "adaptivegears/standard/kubernetes//modules/reconcile-server-side"

  # Add necessary input variables here
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `path` | The path to the module containing Kustomize configurations. | `string` | `"."` | ✓ |

## Requirements

- **Terraform**: `>= 1.0`
- **Providers**:
  - `kustomization` (version `~> 0.9`)
  - `kubectl` (version `~> 2.1`)

## Providers

| Name          | Version |
|---------------|---------|
| kustomization | ~> 0.9  |
| kubectl       | ~> 2.1  |

## Example

```hcl
module "managed_resources" {
  source = "adaptivegears/standard/kubernetes//modules/reconcile-server-side"

  path = "${path.module}/k8s"
}
```

## License

[MIT](LICENSE)

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## Contact

For questions or support, please contact the maintainers at [andrey@andreygubarev.com](mailto:andrey@andreygubarev.com).
```
