<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_account.adl_cosmos](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |
| [http_http.ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_module_enabled"></a> [module\_enabled](#input\_module\_enabled) | Variable to enable or disable the module. | `bool` | `true` | no |
| <a name="input_offer_type"></a> [offer\_type](#input\_offer\_type) | Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard. | `string` | `"Standard"` | no |
| <a name="input_network_acl_bypass_for_azure_services"></a> [network\_acl\_bypass\_for\_azure\_services](#input\_network\_acl\_bypass\_for\_azure\_services) | If azure services can bypass ACLs. | `bool` | `false` | no |
| <a name="input_enable_automatic_failover"></a> [enable\_automatic\_failover](#input\_enable\_automatic\_failover) | Enable automatic fail over for this Cosmos DB account. | `bool` | `true` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this CosmosDB account. | `bool` | `false` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Specifies the Kind of CosmosDB to create. | `string` | `"GlobalDocumentDB"` | no |
| <a name="input_enable_capabilities"></a> [enable\_capabilities](#input\_enable\_capabilities) | Configures the capabilities to enable for the Cosmos DB account. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of CosmosDB account. |
| <a name="output_name"></a> [name](#output\_name) | The name of the CosmosDB account. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the CosmosDB account exists. |
<!-- END_TF_DOCS -->