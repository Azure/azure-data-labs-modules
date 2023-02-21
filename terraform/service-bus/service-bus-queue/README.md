<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_servicebus_queue.adl_sbq](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue) | resource |
| [azurerm_servicebus_queue_authorization_rule.adl_sbq_auth_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_queue_authorization_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_namespace_id"></a> [namespace\_id](#input\_namespace\_id) | The ID of the Service Bus namespace. | `string` | n/a | yes |
| <a name="input_listen"></a> [listen](#input\_listen) | Grants listen access to this this Authorization Rule. | `bool` | `true` | no |
| <a name="input_send"></a> [send](#input\_send) | Grants send access to this this Authorization Rule. | `bool` | `true` | no |
| <a name="input_manage"></a> [manage](#input\_manage) | Grants manage access to this this Authorization Rule. | `bool` | `false` | no |
| <a name="input_enable_partitioning"></a> [enable\_partitioning](#input\_enable\_partitioning) | Boolean flag which controls whether to enable the queue to be partitioned across multiple message brokers. | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->