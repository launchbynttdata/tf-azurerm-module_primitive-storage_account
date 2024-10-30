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

output "id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.storage_account.id
}

output "primary_location" {
  description = "The primary location of the storage account."
  value       = azurerm_storage_account.storage_account.primary_location
}

output "primary_blob_endpoint" {
  description = "The endpoint URL for blob storage in the primary location."
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "storage_containers" {
  description = "Storage container resource map."
  value       = azurerm_storage_container.storage_containers
}

output "storage_queues" {
  description = "Storage queues resource map."
  value       = try(azurerm_storage_queue.storage_queues, null)
}

output "storage_shares" {
  description = "Storage share resource map."
  value       = try(azurerm_storage_share.storage_shares, null)
}

output "primary_web_endpoint" {
  description = "Storage account primary web endpoint."
  value       = azurerm_storage_account.storage_account.primary_web_endpoint
}

output "primary_connection_string" {
  description = "Primary connection string of the storage account."
  value       = azurerm_storage_account.storage_account.primary_connection_string
}

output "secondary_connection_string" {
  description = "Secondary connection string of the storage account."
  value       = azurerm_storage_account.storage_account.secondary_connection_string
}

output "primary_access_key" {
  description = "Primary access key of the storage account."
  value       = azurerm_storage_account.storage_account.primary_access_key
}

output "secondary_access_key" {
  description = "Secondary access key of the storage account."
  value       = azurerm_storage_account.storage_account.secondary_access_key
}
