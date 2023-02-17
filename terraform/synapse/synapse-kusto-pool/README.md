<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azapi_resource.syn_synkp](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |
| [random_string.postfix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_synapse_workspace_id"></a> [synapse\_workspace\_id](#input\_synapse\_workspace\_id) | The ID of the Synapse workspace. | `string` | n/a | yes |
| <a name="input_synapse_workspace_uid"></a> [synapse\_workspace\_uid](#input\_synapse\_workspace\_uid) | The UID of the Synapse workspace. | `string` | n/a | yes |
| <a name="input_enable_purge"></a> [enable\_purge](#input\_enable\_purge) | n/a | `bool` | `false` | no |
| <a name="input_enable_streaming_ingest"></a> [enable\_streaming\_ingest](#input\_enable\_streaming\_ingest) | n/a | `bool` | `false` | no |
| <a name="input_optimized_autoscale_enabled"></a> [optimized\_autoscale\_enabled](#input\_optimized\_autoscale\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_optimized_autoscale_maximum"></a> [optimized\_autoscale\_maximum](#input\_optimized\_autoscale\_maximum) | n/a | `number` | `1` | no |
| <a name="input_optimized_autoscale_minimum"></a> [optimized\_autoscale\_minimum](#input\_optimized\_autoscale\_minimum) | n/a | `number` | `1` | no |
| <a name="input_optimized_autoscale_version"></a> [optimized\_autoscale\_version](#input\_optimized\_autoscale\_version) | n/a | `number` | `1` | no |
| <a name="input_sku_capacity"></a> [sku\_capacity](#input\_sku\_capacity) | n/a | `number` | `2` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | n/a | `string` | `"Compute optimized"` | no |
| <a name="input_sku_size"></a> [sku\_size](#input\_sku\_size) | n/a | `string` | `"Small"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Synapse Kusto Pool. |
<!-- END_TF_DOCS -->