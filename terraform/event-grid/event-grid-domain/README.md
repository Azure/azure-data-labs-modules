<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_eventgrid_domain.adl_evgd](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_domain) | resource |

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
| <a name="input_input_schema"></a> [input\_schema](#input\_input\_schema) | Specifies the schema in which incoming events will be published to this domain. | `string` | `"EventGridSchema"` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this resource. | `bool` | `false` | no |
| <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled) | Whether local authentication methods is enabled for the EventGrid Domain. | `bool` | `true` | no |
| <a name="input_auto_create_topic_with_first_subscription"></a> [auto\_create\_topic\_with\_first\_subscription](#input\_auto\_create\_topic\_with\_first\_subscription) | Whether to create the domain topic when the first event subscription at the scope of the domain topic is created. | `bool` | `true` | no |
| <a name="input_auto_delete_topic_with_last_subscription"></a> [auto\_delete\_topic\_with\_last\_subscription](#input\_auto\_delete\_topic\_with\_last\_subscription) | Whether to delete the domain topic when the last event subscription at the scope of the domain topic is deleted. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Event Grid domain. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Event Grid domain. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Event Grid domain exists. |
<!-- END_TF_DOCS -->