<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_analysis_services_server.adl_as](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/analysis_services_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU for the Analysis Services Server. | `string` | `"S0"` | no |
| <a name="input_enable_power_bi_service"></a> [enable\_power\_bi\_service](#input\_enable\_power\_bi\_service) | Indicates if the Power BI service is allowed to access or not. | `bool` | `true` | no |
| <a name="input_admin_users"></a> [admin\_users](#input\_admin\_users) | List of email addresses of admin user. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Analysis Services Server. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Analysis Services Server. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the Analysis Services Server exists. |
<!-- END_TF_DOCS -->