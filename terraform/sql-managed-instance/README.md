<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_managed_instance.adl_sqlmi](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_instance) | resource |
| [azurerm_subnet_network_security_group_association.adl_sqlmi_snet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.adl_sqlmi_snet_nsg_pe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.adl_sqlmi_snet_rt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.adl_sqlmi_snet_rt_pe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_is_private_endpoint"></a> [is\_private\_endpoint](#input\_is\_private\_endpoint) | Whether private endpoints are enabled to access the resource. | `bool` | `true` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated. | `string` | n/a | yes |
| <a name="input_subnet_private_enpoint_id"></a> [subnet\_private\_enpoint\_id](#input\_subnet\_private\_enpoint\_id) | The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint. | `string` | n/a | yes |
| <a name="input_route_table_id"></a> [route\_table\_id](#input\_route\_table\_id) | The route table for associated with the subnet. | `string` | n/a | yes |
| <a name="input_network_security_group_id"></a> [network\_security\_group\_id](#input\_network\_security\_group\_id) | The NSG for associated with the subnet. | `string` | n/a | yes |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | What type of license the Managed Instance will use. | `string` | `"BasePrice"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the SKU Name for the SQL Managed Instance. | `string` | `"GP_Gen5"` | no |
| <a name="input_storage_size_in_gb"></a> [storage\_size\_in\_gb](#input\_storage\_size\_in\_gb) | Maximum storage space for the SQL Managed instance. | `number` | `32` | no |
| <a name="input_vcores"></a> [vcores](#input\_vcores) | Number of cores that should be assigned to the SQL Managed Instance. | `number` | `4` | no |
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The administrator login name for the new server. | `string` | n/a | yes |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | The password associated with the administrator\_login. | `string` | n/a | yes |
| <a name="input_maintenance_configuration_name"></a> [maintenance\_configuration\_name](#input\_maintenance\_configuration\_name) | The name of the Public Maintenance Configuration window to apply to the SQL Managed Instance. | `string` | `"SQL_Default"` | no |
| <a name="input_dns_zone_partner_id"></a> [dns\_zone\_partner\_id](#input\_dns\_zone\_partner\_id) | The ID of the SQL Managed Instance which will share the DNS zone. | `string` | `""` | no |
| <a name="input_collation"></a> [collation](#input\_collation) | Specifies how the SQL Managed Instance will be collated. | `string` | `"SQL_Latin1_General_CP1_CI_AS"` | no |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | Specifies how the SQL Managed Instance will be collated. | `string` | `"1.2"` | no |
| <a name="input_proxy_override"></a> [proxy\_override](#input\_proxy\_override) | Specifies how the SQL Managed Instance will be accessed. | `string` | `"Default"` | no |
| <a name="input_public_data_endpoint_enabled"></a> [public\_data\_endpoint\_enabled](#input\_public\_data\_endpoint\_enabled) | Is the public data endpoint enabled? | `bool` | `false` | no |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | Specifies the storage account type used to store backups for this database. | `string` | `"GRS"` | no |
| <a name="input_timezone_id"></a> [timezone\_id](#input\_timezone\_id) | The TimeZone ID that the SQL Managed Instance will be operating in. | `string` | `"UTC"` | no |
| <a name="input_private_dns_zone_ids"></a> [private\_dns\_zone\_ids](#input\_private\_dns\_zone\_ids) | Specifies the list of Private DNS Zones to include. | `list(string)` | `[]` | no |
| <a name="input_private_dns_zone_group_name"></a> [private\_dns\_zone\_group\_name](#input\_private\_dns\_zone\_group\_name) | DNS zone group is an association between the private DNS zone and the private endpoint | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of SQL Managed Instance. |
| <a name="output_name"></a> [name](#output\_name) | The name of the SQL Managed Instance. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the SQL Managed Instance exists. |
<!-- END_TF_DOCS -->