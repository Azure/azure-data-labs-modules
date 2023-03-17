<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_synapse_spark_pool.syn_synsp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_spark_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_synapse_workspace_id"></a> [synapse\_workspace\_id](#input\_synapse\_workspace\_id) | The ID of the Synapse workspace. | `string` | n/a | yes |
| <a name="input_node_size_family"></a> [node\_size\_family](#input\_node\_size\_family) | The kind of nodes that the Spark Pool provides. | `string` | `"MemoryOptimized"` | no |
| <a name="input_node_size"></a> [node\_size](#input\_node\_size) | The level of node in the Spark Pool. | `string` | `"Small"` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_cache_size"></a> [cache\_size](#input\_cache\_size) | (Optional) The cache size in the Spark Pool. | `number` | `100` | no |
| <a name="input_spark_version"></a> [spark\_version](#input\_spark\_version) | (Optional) The Apache Spark version. Possible values are 2.4 , 3.1 , 3.2 and 3.3. Defaults to 2.4. | `number` | `2.4` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Synapse Spark Pool. |
<!-- END_TF_DOCS -->