<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_kusto_database.adl_dedb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Specifies the name of the Kusto Cluster this database will be added to. | `string` | n/a | yes |
| <a name="input_hot_cache_period"></a> [hot\_cache\_period](#input\_hot\_cache\_period) | The time the data that should be kept in cache for fast queries as ISO 8601 timespan. | `string` | `"P7D"` | no |
| <a name="input_soft_delete_period"></a> [soft\_delete\_period](#input\_soft\_delete\_period) | The time the data should be kept before it stops being accessible to queries as ISO 8601 timespan. | `string` | `"P31D"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name of the Azure Data Explorer database. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Azure Data Explorer database exists. |
<!-- END_TF_DOCS -->