resource_names_map = {
  resource_group = {
    name       = "rg"
    max_length = 80
  }
  storage_account = {
    name       = "sa"
    max_length = 24
  }
}
instance_env              = 0
instance_resource         = 0
logical_product_family    = "launch"
logical_product_service   = "storage"
class_env                 = "gotest"
location                  = "eastus"
account_tier              = "Standard"
account_replication_type  = "LRS"
enable_https_traffic_only = true
static_website = {
  index_document     = "index.html"
  error_404_document = "404.html"
}
network_rules = {
  default_action = "Deny"
  ip_rules       = ["12.34.56.78"] # Single IPs or CIDR blocks larger than /31 can be added here to grant access. An empty list will deny all public traffic.
}
