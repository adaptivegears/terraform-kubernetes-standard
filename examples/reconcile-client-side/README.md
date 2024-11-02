# Reconcile Client Side Terraform Module

The `reconcile-client-side` Terraform module manages Kubernetes resources using Terraform with a Kubernetes backend. This module allows you to define and maintain your Kubernetes infrastructure as code, ensuring consistency and reproducibility.

## Features

- **Kubernetes Backend**: Stores Terraform state within a Kubernetes secret for secure state management.
- **Modular Configuration**: Organizes Kubernetes manifests using Terraform modules for better scalability and maintainability.

## Prerequisites

- **Terraform**: Ensure you have Terraform installed on your machine.
- **Kubernetes Cluster**: A running Kubernetes cluster to manage resources.
- **AdaptiveGears Standard Modules**: The source specified (`adaptivegears/standard/kubernetes//modules/reconcile-client-side`) should be accessible from your Terraform setup.

## Usage

To use the `reconcile-client-side` module in your Terraform configuration, follow these steps:

1. **Configure Kubernetes Access**

   Ensure that your Kubernetes configuration (`kubeconfig`) is set up to communicate with the desired Kubernetes cluster. You can specify the `KUBECONFIG_PATH` environment variable to point to your kubeconfig file.

   ```bash
   export KUBECONFIG_PATH=/path/to/your/kubeconfig
   ```

   Alternatively, you can place your kubeconfig file in the default location (`~/.kube/config`).

2. **Initialize the Backend**

   Configure Terraform to use the Kubernetes backend by specifying the appropriate namespace and secret suffix.

   ```hcl
   terraform {
     backend "kubernetes" {
       namespace     = "kube-system"
       secret_suffix = "reconcile-client-side"
     }
   }
   ```

3. **Include the Module**

   Add the `reconcile-client-side` module to your Terraform configuration by specifying the source and path.

   ```hcl
   module "managed_resources" {
     source = "adaptivegears/standard/kubernetes//modules/reconcile-client-side"

     path = "${path.module}/k8s"
   }
   ```

4. **Define Kubernetes Manifests**

   Place your Kubernetes manifest files (e.g., `deployment.yaml`, `service.yaml`) in the specified `k8s` directory. The module will manage these resources based on your configuration.

5. **Apply the Configuration**

   Initialize and apply the Terraform configuration:

    ```bash
    terraform init
    terraform apply
    ```

This will set up the Kubernetes resources as defined in your manifests and manage the Terraform state within the specified Kubernetes backend.

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
