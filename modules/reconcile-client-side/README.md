# Reconcile Client-Side Module

The `reconcile-client-side` Terraform module manages resources using Kustomize with client-side apply. It ensures that Kubernetes manifests are applied in the correct order with appropriate dependencies and timeouts.

## Features

- **Resource Management**: Handles multiple resource priorities to ensure proper ordering.
- **Sensitive Data Handling**: Automatically marks sensitive resources to ensure they are handled securely.
- **Timeouts and Dependencies**: Configurable timeouts and dependencies between resources to manage deployment flow.

## Usage

```hcl
module "managed_resources" {
  source = "adaptivegears/standard/kubernetes//modules/reconcile-client-side"

  kustomization = "${path.module}/k8s"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `kustomization` | The path to the module containing Kustomize configurations. | `string` | `"."` | ✓ |


## Requirements

- **Terraform**: `>= 1.0`
- **Providers**:
  - `kustomization` (version `~> 0.9`)

## Providers

| Name | Version |
|------|---------|
| kustomization | ~> 0.9 |

## Example

```hcl
module "managed_resources" {
  source = "adaptivegears/standard/kubernetes//modules/reconcile-client-side"

  kustomization = "${path.module}/k8s"
}
```

## License

[MIT](LICENSE)

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## Contact

For questions or support, please contact the maintainers at [andrey@andreygubarev.com](mailto:andrey@andreygubarev.com).
