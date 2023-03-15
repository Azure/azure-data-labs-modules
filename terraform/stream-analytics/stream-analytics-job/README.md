<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_stream_analytics_job.adl_asa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_compatibility_level"></a> [compatibility\_level](#input\_compatibility\_level) | Specifies the compatibility level for this job - which controls certain runtime behaviours of the streaming job. | `string` | `"1.2"` | no |
| <a name="input_data_locale"></a> [data\_locale](#input\_data\_locale) | Specifies the Data Locale of the Job, which should be a supported .NET Culture. | `string` | `"en-GB"` | no |
| <a name="input_events_late_arrival_max_delay_in_seconds"></a> [events\_late\_arrival\_max\_delay\_in\_seconds](#input\_events\_late\_arrival\_max\_delay\_in\_seconds) | Specifies the maximum tolerable delay in seconds where events arriving late could be included. | `number` | `60` | no |
| <a name="input_events_out_of_order_max_delay_in_seconds"></a> [events\_out\_of\_order\_max\_delay\_in\_seconds](#input\_events\_out\_of\_order\_max\_delay\_in\_seconds) | Specifies the maximum tolerable delay in seconds where out-of-order events can be adjusted to be back in order. | `number` | `50` | no |
| <a name="input_events_out_of_order_policy"></a> [events\_out\_of\_order\_policy](#input\_events\_out\_of\_order\_policy) | Specifies the policy which should be applied to events which arrive out of order in the input event stream. | `string` | `"Adjust"` | no |
| <a name="input_output_error_policy"></a> [output\_error\_policy](#input\_output\_error\_policy) | Specifies the policy which should be applied to events which arrive at the output and cannot be written to the external storage due to being malformed (such as missing column values, column values of wrong type or size). | `string` | `"Drop"` | no |
| <a name="input_streaming_units"></a> [streaming\_units](#input\_streaming\_units) | Specifies the number of streaming units that the streaming job uses. | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Stream Analytics job. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Stream Analytics job. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Stream Analytics job exists. |
<!-- END_TF_DOCS -->