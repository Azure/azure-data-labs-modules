<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_search_service.adl_srch](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/search_service) | resource |
| [http_http.ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_is_private_endpoint"></a> [is\_private\_endpoint](#input\_is\_private\_endpoint) | Whether private endpoints are enabled to access the resource. | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint. | `string` | `""` | no |
| <a name="input_private_dns_zone_ids"></a> [private\_dns\_zone\_ids](#input\_private\_dns\_zone\_ids) | Specifies the list of Private DNS Zones to include. | `list(string)` | `[]` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU which should be used for this Search Service. | `string` | `"standard"` | no |
| <a name="input_partition_count"></a> [partition\_count](#input\_partition\_count) | The number of partitions which should be created. | `number` | `1` | no |
| <a name="input_replica_count"></a> [replica\_count](#input\_replica\_count) | The number of replica's which should be created. | `number` | `1` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this resource. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Cognitive Search. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Cognitive Search. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Cognitive Search exists. |
<!-- END_TF_DOCS -->