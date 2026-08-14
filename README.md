# tf-azurerm-module_primitive-storage_account (Azure Storage Account)

## Overview

This terraform module will install storage account in the Azure portal. User can also create containers and file shares by passing in appropriate input variables.

## Usage

See [examples/storage_account](examples/storage_account) for a full working example.

## Module Development

### Pre-Requisites

The following commands should be available on your system:

- `asdf` or `mise`
- `make`
- `python3` (for pre-commit)

Additionally, your `git` user and email must be configured. Run the `make configure` command from the root of the repository to ensure that you meet these requirements.

### Pre-Commit hooks

The [.pre-commit-config.yaml](.pre-commit-config.yaml) file defines `pre-commit` hooks for Terraform formatting, validation, documentation generation, and detect-secrets. Hooks are installed when you run `make configure`. Go linting runs via `make lint` in local development and CI, not via pre-commit.

### Terratest examples

Post-deploy tests in `tests/post_deploy_functional/` and `tests/post_deploy_functional_readonly/` target `examples/storage_account` via an explicit folder constant in each `main_test.go`. Adding another example (for example `examples/minimal`) requires a new test entry point or updating that constant; it is not picked up automatically.

### Local Validation

You should validate the changes you make to any module locally, prior to pushing your changes in a branch to GitHub.

1. Ensure that you have run `make configure` successfully.
2. Ensure you are signed into the appropriate cloud provider (e.g. Azure) for the module under test in your current console session.
3. Run the Terraform and Golang linters:

```
make lint
```

4. Once linters pass, run integration tests (apply, test, destroy):

```
make test
```

The pre-commit validations, as well as the `make lint` and `make test` targets, are performed in CI. Running them locally before opening a PR helps ensure a smooth review.

### Review & Merge Process

Open a Pull Request to the default (`main`) branch. The PR title must follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification) format to merge and to drive semantic versioning.

Ensure CI workflows pass, address review feedback, and obtain approvals required by `CODEOWNERS`.

### Automatic Updates

Shared configuration and workflow files are largely managed through [launch-terraform-skeleton](https://github.com/launchbynttdata/launch-terraform-skeleton). Avoid one-off edits to copied skeleton files in this repository unless necessary (for example `.gitignore` entries for generated artifacts). Use `copier check-update` / `copier update` when refreshing from the skeleton.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0, < 2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.77, < 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_network_rules.network_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |
| [azurerm_storage_container.storage_containers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_storage_queue.storage_queues](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_queue) | resource |
| [azurerm_storage_share.storage_shares](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_share) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | Choose between Hot or Cool | `string` | `"Hot"` | no |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | Defines the kind of account | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | value of the account\_replication\_type | `string` | `"LRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | value of the account\_tier | `string` | `"Standard"` | no |
| <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public) | Allow or disallow anonymous public read access for containers and blobs. | `bool` | `false` | no |
| <a name="input_blob_change_feed_enabled"></a> [blob\_change\_feed\_enabled](#input\_blob\_change\_feed\_enabled) | Is the blobl service properties for change feed enabled for blob | `bool` | `false` | no |
| <a name="input_blob_change_feed_retention_in_days"></a> [blob\_change\_feed\_retention\_in\_days](#input\_blob\_change\_feed\_retention\_in\_days) | Number of days to retain blob change feed. Set 0 to disable | `number` | `0` | no |
| <a name="input_blob_container_delete_retention_policy"></a> [blob\_container\_delete\_retention\_policy](#input\_blob\_container\_delete\_retention\_policy) | Specify the number of days that the container should be retained. Set 0 to disable | `number` | `0` | no |
| <a name="input_blob_cors_rule"></a> [blob\_cors\_rule](#input\_blob\_cors\_rule) | Blob cors rules | <pre>map(object({<br/>    allowed_headers    = list(string)<br/>    allowed_methods    = list(string)<br/>    allowed_origins    = list(string)<br/>    exposed_headers    = list(string)<br/>    max_age_in_seconds = number<br/>  }))</pre> | `null` | no |
| <a name="input_blob_delete_retention_policy"></a> [blob\_delete\_retention\_policy](#input\_blob\_delete\_retention\_policy) | Number of days the blob should be retained. Set 0 to disable | `number` | `0` | no |
| <a name="input_blob_last_access_time_enabled"></a> [blob\_last\_access\_time\_enabled](#input\_blob\_last\_access\_time\_enabled) | Is the last access time based tracking enabled | `bool` | `false` | no |
| <a name="input_blob_versioning_enabled"></a> [blob\_versioning\_enabled](#input\_blob\_versioning\_enabled) | Is blob versioning enabled for blob | `bool` | `false` | no |
| <a name="input_enable_https_traffic_only"></a> [enable\_https\_traffic\_only](#input\_enable\_https\_traffic\_only) | Boolean flag that forces HTTPS traffic only | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | target resource group resource mask | `string` | n/a | yes |
| <a name="input_network_rules"></a> [network\_rules](#input\_network\_rules) | An object defining rules around network access for the Storage Account. | <pre>object({<br/>    default_action             = optional(string, "Deny")<br/>    bypass                     = optional(list(string), ["AzureServices", "Logging", "Metrics"])<br/>    ip_rules                   = optional(list(string), [])<br/>    virtual_network_subnet_ids = optional(list(string), [])<br/>    private_link_access = optional(list(object({<br/>      endpoint_resource_id = string<br/>      endpoint_tenant_id   = optional(string, null)<br/>    })), [])<br/>  })</pre> | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether the public network access is enabled. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | target resource group resource mask | `string` | n/a | yes |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | The static website details if the storage account needs to be used as a static website | <pre>object({<br/>    index_document     = string<br/>    error_404_document = string<br/>  })</pre> | `null` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Storage account name | `string` | `"storageaccount"` | no |
| <a name="input_storage_containers"></a> [storage\_containers](#input\_storage\_containers) | map of storage container configs, keyed polymorphically | <pre>map(object({<br/>    name                  = string<br/>    container_access_type = string<br/>  }))</pre> | `{}` | no |
| <a name="input_storage_queues"></a> [storage\_queues](#input\_storage\_queues) | map of storage queue configs, keyed polymorphically | <pre>map(object({<br/>    name = string<br/>  }))</pre> | `{}` | no |
| <a name="input_storage_shares"></a> [storage\_shares](#input\_storage\_shares) | map of storage file shares configs, keyed polymorphically | <pre>map(object({<br/>    name  = string<br/>    quota = number<br/>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Storage Account. |
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | Primary access key of the storage account. |
| <a name="output_primary_blob_endpoint"></a> [primary\_blob\_endpoint](#output\_primary\_blob\_endpoint) | The endpoint URL for blob storage in the primary location. |
| <a name="output_primary_connection_string"></a> [primary\_connection\_string](#output\_primary\_connection\_string) | Primary connection string of the storage account. |
| <a name="output_primary_location"></a> [primary\_location](#output\_primary\_location) | The primary location of the storage account. |
| <a name="output_primary_web_endpoint"></a> [primary\_web\_endpoint](#output\_primary\_web\_endpoint) | Storage account primary web endpoint. |
| <a name="output_secondary_access_key"></a> [secondary\_access\_key](#output\_secondary\_access\_key) | Secondary access key of the storage account. |
| <a name="output_secondary_connection_string"></a> [secondary\_connection\_string](#output\_secondary\_connection\_string) | Secondary connection string of the storage account. |
| <a name="output_storage_containers"></a> [storage\_containers](#output\_storage\_containers) | Storage container resource map. |
| <a name="output_storage_queues"></a> [storage\_queues](#output\_storage\_queues) | Storage queues resource map. |
| <a name="output_storage_shares"></a> [storage\_shares](#output\_storage\_shares) | Storage share resource map. |
<!-- END_TF_DOCS -->
