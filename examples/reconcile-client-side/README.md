# Reconcile Client Side Terraform Module

The `reconcile-client-side` Terraform module manages Kubernetes resources using Terraform with a Kubernetes backend. This module allows you to define and maintain your Kubernetes infrastructure as code, ensuring consistency and reproducibility.

## Features

- **Kubernetes Backend**: Stores Terraform state within a Kubernetes secret for secure state management.
- **Modular Configuration**: Organizes Kubernetes manifests using Terraform modules for better scalability and maintainability.

## Usage

To use the `reconcile-client-side` module in your Terraform configuration, follow these steps:

1. **Initialize the Backend**

   Configure Terraform to use the Kubernetes backend by specifying the appropriate namespace and secret suffix.

   ```hcl
   terraform {
     backend "kubernetes" {
       namespace     = "kube-system"
       secret_suffix = "reconcile-client-side"
     }
   }
   ```

2. **Include the Module**

   Add the `reconcile-client-side` module to your Terraform configuration by specifying the source and path.

   ```hcl
   module "managed_resources" {
     source = "adaptivegears/standard/kubernetes//modules/reconcile-client-side"

     path = "${path.module}/k8s"
   }
   ```

3. **Define Kubernetes Manifests**

   Place your Kubernetes manifest files (e.g., `deployment.yaml`, `service.yaml`) in the specified `k8s` directory. The module will manage these resources based on your configuration.

## Prerequisites

- **Terraform**: Ensure you have Terraform installed on your machine.
- **Kubernetes Cluster**: A running Kubernetes cluster to manage resources.
- **AdaptiveGears Standard Modules**: The source specified (`adaptivegears/standard/kubernetes//modules/reconcile-client-side`) should be accessible from your Terraform setup.

## Example Directory Structure

```
reconcile-client-side/
├── main.tf
├── terraform.tf
└── k8s/
    ├── deployment.yaml
    ├── service.yaml
    └── kustomization.yaml
```

## Getting Started

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-repo/reconcile-client-side.git
   cd reconcile-client-side
   ```

2. **Configure Terraform**

   Update the `terraform.tf` and `main.tf` files as needed to match your Kubernetes environment and desired state.

3. **Apply the Configuration**

   Initialize and apply the Terraform configuration:

   ```bash
   terraform init
   terraform apply
   ```

This will set up the Kubernetes resources as defined in your manifests and manage the Terraform state within the specified Kubernetes backend.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
