<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_machine_learning_compute_cluster.adl_mlw_compute_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_compute_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_machine_learning_workspace_id"></a> [machine\_learning\_workspace\_id](#input\_machine\_learning\_workspace\_id) | The ID of the Machine Learning workspace. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint. | `string` | n/a | yes |
| <a name="input_vm_priority"></a> [vm\_priority](#input\_vm\_priority) | The priority of the VM. | `string` | `"LowPriority"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the VM. | `string` | `"Standard_DS2_v2"` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Machine Learning Compute Cluster. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Machine Learning Compute Cluster. |
<!-- END_TF_DOCS -->