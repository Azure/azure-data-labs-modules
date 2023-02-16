<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_synapse_sql_pool.syn_syndp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_sql_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_synapse_workspace_id"></a> [synapse\_workspace\_id](#input\_synapse\_workspace\_id) | The ID of the Synapse workspace. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the SKU Name for this Synapse Sql Pool. | `string` | `"DW100c"` | no |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | Specifies how to create the Sql Pool. | `string` | `"Default"` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Synapse SQL Pool. |
<!-- END_TF_DOCS -->