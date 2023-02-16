<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_machine_learning_inference_cluster.adl_mlw_inference_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/machine_learning_inference_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_machine_learning_workspace_id"></a> [machine\_learning\_workspace\_id](#input\_machine\_learning\_workspace\_id) | The ID of the Machine Learning workspace. | `string` | n/a | yes |
| <a name="input_kubernetes_cluster_id"></a> [kubernetes\_cluster\_id](#input\_kubernetes\_cluster\_id) | The ID of the Kubernestes cluster. | `string` | n/a | yes |
| <a name="input_cluster_purpose"></a> [cluster\_purpose](#input\_cluster\_purpose) | The purpose of the Inference Cluster. | `string` | `"FastProd"` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Machine Learning Inference Cluster. |
<!-- END_TF_DOCS -->