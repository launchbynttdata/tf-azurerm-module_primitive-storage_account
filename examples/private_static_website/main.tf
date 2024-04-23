// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module "storage_account" {
  source  = "d2lqlh14iel5k2.cloudfront.net/module_primitive/storage_account/azurerm"
  version = "~> 1.1"

  resource_group_name                    = module.resource_group.name
  location                               = var.location
  storage_account_name                   = local.storage_account_name
  account_replication_type               = var.account_replication_type
  account_tier                           = var.account_tier
  storage_containers                     = var.storage_containers
  storage_shares                         = var.storage_shares
  storage_queues                         = var.storage_queues
  static_website                         = var.static_website
  enable_https_traffic_only              = var.enable_https_traffic_only
  access_tier                            = var.access_tier
  account_kind                           = var.account_kind
  blob_cors_rule                         = var.blob_cors_rule
  blob_delete_retention_policy           = var.blob_delete_retention_policy
  blob_versioning_enabled                = var.blob_versioning_enabled
  blob_change_feed_enabled               = var.blob_change_feed_enabled
  blob_last_access_time_enabled          = var.blob_last_access_time_enabled
  blob_container_delete_retention_policy = var.blob_container_delete_retention_policy
  network_rules                          = var.network_rules

  depends_on = [module.resource_group]
}

module "resource_group" {
  source  = "d2lqlh14iel5k2.cloudfront.net/module_primitive/resource_group/azurerm"
  version = "~> 1.0"

  name     = local.resource_group_name
  location = var.location
  tags = {
    resource_name = local.resource_group_name
  }
}

module "resource_names" {
  source  = "d2lqlh14iel5k2.cloudfront.net/module_library/resource_name/launch"
  version = "~> 1.0"

  for_each = var.resource_names_map

  region                  = join("", split("-", var.location))
  class_env               = var.class_env
  cloud_resource_type     = each.value.name
  instance_env            = var.instance_env
  instance_resource       = var.instance_resource
  maximum_length          = each.value.max_length
  logical_product_family  = var.logical_product_family
  logical_product_service = var.logical_product_service
}

resource "null_resource" "upload_static_website_files" {
  provisioner "local-exec" {
    command = <<-EOF
      find ./site_files -type f -exec az storage blob upload --file {} -c \$web --account-name ${local.storage_account_name} --only-show-errors \;
EOF
  }

  depends_on = [module.storage_account]
}
