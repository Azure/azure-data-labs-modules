<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_servicebus_subscription.adt_sbs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_subscription) | resource |
| [azurerm_servicebus_subscription_rule.adl_sbs_auth_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_subscription_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_topic_id"></a> [topic\_id](#input\_topic\_id) | The ID of the ServiceBus Topic to create this Subscription in. | `string` | n/a | yes |
| <a name="input_max_delivery_count"></a> [max\_delivery\_count](#input\_max\_delivery\_count) | The maximum number of deliveries. | `number` | `1` | no |
| <a name="input_filter_type"></a> [filter\_type](#input\_filter\_type) | Type of filter to be applied to a BrokeredMessage. | `string` | `"SqlFilter"` | no |
| <a name="input_sql_filter"></a> [sql\_filter](#input\_sql\_filter) | Represents a filter written in SQL language-based syntax that to be evaluated against a BrokeredMessage. | `string` | `"colour = 'red'"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->