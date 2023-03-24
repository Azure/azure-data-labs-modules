<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_firewall_rule.metastore_server_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_server.adl_sql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_is_private_endpoint"></a> [is\_private\_endpoint](#input\_is\_private\_endpoint) | Whether private endpoints are enabled to access the resource. | `bool` | `true` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint. | `string` | `""` | no |
| <a name="input_private_dns_zone_ids"></a> [private\_dns\_zone\_ids](#input\_private\_dns\_zone\_ids) | Specifies the list of Private DNS Zones to include. | `list(string)` | `[]` | no |
| <a name="input_db_version"></a> [db\_version](#input\_db\_version) | The version for the new server. | `string` | n/a | yes |
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The administrator login name for the new server. | `string` | n/a | yes |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | The password associated with the administrator\_login. | `string` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. | `string` | `"1.2"` | no |
| <a name="input_azuread_administrator"></a> [azuread\_administrator](#input\_azuread\_administrator) | "<br>        login\_username - The login username of the Azure AD Administrator of this SQL Server.<br>        object\_id - The object id of the Azure AD Administrator of this SQL Server.<br>        tenant\_id - The tenant id of the Azure AD Administrator of this SQL Server.<br>        azuread\_authentication\_only - Specifies whether only AD Users and administrators (like azuread\_administrator.0.login\_username) can be used to login, or also local database users (like administrator\_login). When true, the administrator\_login and administrator\_login\_password properties can be omitted.<br>    " | <pre>map(<br>    object(<br>      {<br>        login_username              = optional(string)<br>        object_id                   = optional(string)<br>        tenant_id                   = optional(string)<br>        azuread_authentication_only = optional(bool)<br>      }<br>    )<br>  )</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of SQL Database server. |
| <a name="output_name"></a> [name](#output\_name) | The name of the SQL Database server. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the SQL Database server exists. |
| <a name="output_fully_qualified_domain_name"></a> [fully\_qualified\_domain\_name](#output\_fully\_qualified\_domain\_name) | The fully qualified domain name of the Azure SQL Server. |
<!-- END_TF_DOCS -->