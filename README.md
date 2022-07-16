# Google Cloud Platform (GCP) Service Account Terraform Module


Terraform module for creating a service account and related Google Service APIs
in Google Cloud Platform. This module supports granting multiple roles to the
service account and creating a private key.

For detail you can look at [gcp service account with terraform].


# Compatibility

This module is meant for use with Terraform 0.13+ and tested using Terraform
1.0+.


## Usage

As an example, in order create a **Storage Bucket Admin Service Account**:

```hcl
module "storage_service_account" {
  source = "git@github.com:serhatteker/gcp-service-account-terraform.git?ref=master"

  project_id = "some-project-id"

  account_id  = "bucket-admin"
  description = "Bucket Admin"
  roles       = ["roles/storage.admin"]
}
```

If you also need to activate related Google Service API, add `gcp_service_list`:

```hcl
module "storage_service_account" {
  source = "git@github.com:serhatteker/gcp-service-account-terraform.git?ref=master"

  gcp_service_list = ["storage.googleapis.com"]
  project_id = "some-project-id"

  account_id  = "bucket-admin"
  description = "Bucket Admin"
  roles       = ["roles/storage.admin"]
}
```

Then perform the following commands on the root folder:

* `terraform init` to get the plugins
* `terraform plan` to see the infrastructure plan
* `terraform apply` to apply the infrastructure build
* `terraform destroy` to destroy the built infrastructure

If you need any more detail please go look at [gcp service account with
terraform].

## Inputs

| Name               | Description                             | Type     | Default                | Required |
|:-------------------|:----------------------------------------|:--------:|:----------------------:|:--------:|
| `project_id`       | The related project ID                  | `string` | -                      | yes      |
| `account_id`       | The service account ID                  | `string` | -                      | yes      |
| `description`      | The description for the service account | `string` | `managed-by-terraform` | no       |
| `roles`            | The roles that will be granted          | `list`   | `[]`                   | no       |
| `gcp_service_list` | The necessary GCP services              | `list`   | `[]`                   | no       |


## Outputs

| Name                  | Description                                                  |
|:----------------------|:-------------------------------------------------------------|
| `email`               | The e-mail address of the service account                    |
| `name`                | The fully-qualified name of the service account              |
| `account_id`          | The unique id of the service account                         |
| `private_key`         | The private key that was created for the account (sensitive) |
| `decoded_private_key` | The base64 decoded private key (sensitive)                   |




[gcp service account with terraform]: https://tech.serhatteker.com/post/2022-07/gcp-service-account-with-terraform/
