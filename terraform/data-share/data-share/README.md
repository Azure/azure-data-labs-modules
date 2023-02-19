<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_data_share.adl_ds](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_share) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The ID of the Data Share account in which the Data Share is created. | `string` | n/a | yes |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | The kind of the Data Share. | `string` | `"CopyBased"` | no |
| <a name="input_description"></a> [description](#input\_description) | The Data Share's description. | `string` | `""` | no |
| <a name="input_terms"></a> [terms](#input\_terms) | The terms of the Data Share. | `string` | `""` | no |
| <a name="input_snapshot_schedule"></a> [snapshot\_schedule](#input\_snapshot\_schedule) | "name - The name of the snapshot schedule.<br>   recurrence - The interval of the synchronization with the source data. Possible values are Hour and Day.<br>   start\_time - The synchronization with the source data's start time." | <pre>map(<br>    object(<br>      {<br>        name       = optional(string)<br>        recurrence = optional(string)<br>        start_time = optional(string)<br>      }<br>    )<br>  )</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of Data Share. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Data Share. |
<!-- END_TF_DOCS -->