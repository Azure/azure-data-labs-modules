<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_eventhub.adl_evh](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_eventhub_authorization_rule.adl_evh_auth_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_authorization_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | Specifies the name of the EventHub Namespace. | `string` | n/a | yes |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_partition_count"></a> [partition\_count](#input\_partition\_count) | Specifies the current number of shards on the Event Hub. | `number` | `2` | no |
| <a name="input_message_retention"></a> [message\_retention](#input\_message\_retention) | Specifies the number of days to retain the events for this Event Hub. | `number` | `1` | no |
| <a name="input_listen"></a> [listen](#input\_listen) | Grants listen access to this this Authorization Rule. | `bool` | `true` | no |
| <a name="input_send"></a> [send](#input\_send) | Grants send access to this this Authorization Rule. | `bool` | `true` | no |
| <a name="input_manage"></a> [manage](#input\_manage) | Grants manage access to this this Authorization Rule. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Event Hub. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Event Hub. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Event Hub exists. |
| <a name="output_primary_connection_string"></a> [primary\_connection\_string](#output\_primary\_connection\_string) | Primary connection string of the instance of Event Hub. |
| <a name="output_secondary_connection_string"></a> [secondary\_connection\_string](#output\_secondary\_connection\_string) | Secondary connection string of the instance of Event Hub. |
<!-- END_TF_DOCS -->