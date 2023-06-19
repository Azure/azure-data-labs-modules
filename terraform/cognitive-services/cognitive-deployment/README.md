<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_cognitive_deployment.adl_cog_dpl](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_deployment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_cognitive_account_id"></a> [cognitive\_account\_id](#input\_cognitive\_account\_id) | The ID of the Cognitive Services Account. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_model_format"></a> [model\_format](#input\_model\_format) | The format of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created. Possible value is OpenAI. | `string` | `"OpenAI"` | no |
| <a name="input_model_name"></a> [model\_name](#input\_model\_name) | The name of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_model_version"></a> [model\_version](#input\_model\_version) | The version of Cognitive Services Account Deployment model. | `string` | n/a | yes |
| <a name="input_scale_type"></a> [scale\_type](#input\_scale\_type) | TDeployment scale type. Possible value is Standard. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_rai_policy_name"></a> [rai\_policy\_name](#input\_rai\_policy\_name) | The name of RAI policy. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Cognitive Deployment. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Cognitive Deployment. |
<!-- END_TF_DOCS -->