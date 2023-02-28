<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_database.adl_sqldb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | The id of the SQL Server on which to create the database. | `string` | n/a | yes |
| <a name="input_collation"></a> [collation](#input\_collation) | The name of the collation. | `string` | `"SQL_Latin1_General_CP1_CI_AS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of SQL Database. |
| <a name="output_name"></a> [name](#output\_name) | The name of the SQL Database. |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | Resource Group where the SQL Database exists. |
<!-- END_TF_DOCS -->