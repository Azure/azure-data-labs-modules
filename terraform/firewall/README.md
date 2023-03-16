<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_firewall.adl_afw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall) | resource |
| [azurerm_firewall_policy.adl_afw_afwp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy) | resource |
| [azurerm_public_ip.adl_afw_pip_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.adl_afw_pip_mngmt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | SKU name of the Firewall. Possible values are AZFW\_Hub and AZFW\_VNet. Changing this forces a new resource to be created. | `string` | `"AZFW_VNet"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | SKU tier of the Firewall. Possible values are Premium, Standard and Basic. | `string` | `"Standard"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Specifies a list of Availability Zones in which this Azure Firewall should be located. Changing this forces a new Azure Firewall to be created. | `list(string)` | `[]` | no |
| <a name="input_threat_intel_mode"></a> [threat\_intel\_mode](#input\_threat\_intel\_mode) | The operation mode for threat intelligence-based filtering. Possible values are: Off, Alert and Deny. Defaults to Alert. | `string` | `"Alert"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Reference to the subnet associated with the IP Configuration. | `string` | `null` | no |
| <a name="input_management_subnet_id"></a> [management\_subnet\_id](#input\_management\_subnet\_id) | Reference to the subnet associated with the IP Configuration. Changing this forces a new resource to be created. The Management Subnet used for the Firewall must have the name AzureFirewallManagementSubnet and the subnet mask must be at least a /26. | `string` | `null` | no |
| <a name="input_public_ip_count"></a> [public\_ip\_count](#input\_public\_ip\_count) | Specifies the number of public IPs to assign to the Firewall. Defaults to 1. | `number` | `1` | no |
| <a name="input_pip_allocation_method"></a> [pip\_allocation\_method](#input\_pip\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic. | `string` | `"Static"` | no |
| <a name="input_pip_sku"></a> [pip\_sku](#input\_pip\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_sku_policy"></a> [sku\_policy](#input\_sku\_policy) | The SKU Tier of the Firewall Policy. Possible values are Standard, Premium. Changing this forces a new Firewall Policy to be created. | `string` | `"Standard"` | no |
| <a name="input_proxy_enabled"></a> [proxy\_enabled](#input\_proxy\_enabled) | Whether to enable DNS proxy on Firewalls attached to this Firewall Policy? Defaults to false. | `bool` | `false` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | A list of custom DNS servers' IP addresses. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Azure Firewall. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Azure Firewall. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Azure Firewall exists. |
<!-- END_TF_DOCS -->