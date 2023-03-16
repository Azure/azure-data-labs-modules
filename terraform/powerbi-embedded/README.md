<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_powerbi_embedded.adl_pbi](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/powerbi_embedded) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Sets the PowerBI Embedded's pricing level's SKU. | `string` | `"A1"` | no |
| <a name="input_administrators"></a> [administrators](#input\_administrators) | A set of administrator user identities, which manages the Power BI Embedded and must be a member user or a service principal in your AAD tenant. | `list(string)` | n/a | yes |
| <a name="input_mode"></a> [mode](#input\_mode) | Sets the PowerBI Embedded's mode. | `string` | `"Gen1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Power BI Embedded. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Power BI Embedded. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Power BI Embedded exists. |
<!-- END_TF_DOCS -->