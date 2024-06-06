locals {
  storage_account_name = module.resource_names["storage_account"].minimal_random_suffix_without_any_separators
  resource_group_name  = module.resource_names["resource_group"].minimal_random_suffix
  virtual_network_name = module.resource_names["virtual_network"].minimal_random_suffix
  endpoint_name        = module.resource_names["private_endpoint"].minimal_random_suffix
}
