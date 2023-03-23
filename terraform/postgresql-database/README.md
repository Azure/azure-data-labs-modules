<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_flexible_server.adl_psql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_database.adl_psql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_is_private_endpoint"></a> [is\_private\_endpoint](#input\_is\_private\_endpoint) | Whether private endpoints are enabled to access the resource. | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet delegated to PostgreSQL for the service to be injected privately in that subnet | `string` | `""` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | Specifies the Private DNS Zone to include | `string` | `""` | no |
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The Administrator login for the PostgreSQL Server | `string` | `"sqladminuser"` | no |
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | The Password associated with the administrator\_login | `string` | `"ThisIsNotVerySecure!"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the SKU Name for this PostgreSQL Server | `string` | `"GP_Standard_D4s_v3"` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | Max storage allowed for this PostgreSQL Server | `number` | `65536` | no |
| <a name="input_ver"></a> [ver](#input\_ver) | Specifies the version of PostgreSQL to use | `string` | `"14"` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Backup retention days for the server | `number` | `7` | no |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Turn Geo-redundant server backups on/off. | `bool` | `false` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this server. | `bool` | `false` | no |
| <a name="input_charset"></a> [charset](#input\_charset) | Specifies the Charset for the PostgreSQL Database. | `string` | `"UTF8"` | no |
| <a name="input_collation"></a> [collation](#input\_collation) | Specifies the Collation for the PostgreSQL Database | `string` | `"en_US.utf8"` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies the IDs of the User Assigned Managed Identities to be assigned to the PostgreSQL Server | `list(string)` | `[]` | no |
| <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key) | Specifies the ID of the User Assigned Managed Identity to be used by PostgreSQL Server to access the Customer Managed Key | <pre>map(<br>    object(<br>      {<br>        key_vault_key_id                  = optional(string)<br>        primary_user_assigned_identity_id = optional(string)<br>      }<br>    )<br>  )</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of PostgreSQL Flexible Server database. |
| <a name="output_database_name"></a> [database\_name](#output\_database\_name) | The name of the PostgreSQL Flexible Server database. |
| <a name="output_server_name"></a> [server\_name](#output\_server\_name) | The name of the PostgreSQL Flexible Server server. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the PostgreSQL Flexible Server server exists. |
<!-- END_TF_DOCS -->