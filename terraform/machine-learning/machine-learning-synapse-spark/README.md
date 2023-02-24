<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_machine_learning_synapse_spark.adl_mlw_synapse_spark](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_synapse_spark) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_machine_learning_workspace_id"></a> [machine\_learning\_workspace\_id](#input\_machine\_learning\_workspace\_id) | The ID of the Machine Learning workspace. | `string` | n/a | yes |
| <a name="input_synapse_spark_pool_id"></a> [synapse\_spark\_pool\_id](#input\_synapse\_spark\_pool\_id) | The ID of the Synapse Spark pool. | `string` | n/a | yes |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Machine Learning Synapse Spark Pool. |
<!-- END_TF_DOCS -->