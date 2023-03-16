<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [azurerm_hdinsight_spark_cluster.adl_hdi_spark](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/hdinsight_spark_cluster) | resource |
| [azurerm_role_assignment.hdi_spark_st_role_id_sbdo](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Basename of the module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the deployed resource. | `map(string)` | `{}` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet from which private IP addresses will be allocated for this Private Endpoint. | `string` | n/a | yes |
| <a name="input_virtual_network_id"></a> [virtual\_network\_id](#input\_virtual\_network\_id) | The ID of the vnet. | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Specifies the Version of HDInsights which should be used for this Cluster. | `string` | n/a | yes |
| <a name="input_component_version_spark"></a> [component\_version\_spark](#input\_component\_version\_spark) | The version of Spark which should be used for this HDInsight Spark Cluster. | `string` | n/a | yes |
| <a name="input_gateway_username"></a> [gateway\_username](#input\_gateway\_username) | The username used for the Ambari Portal. | `string` | n/a | yes |
| <a name="input_gateway_password"></a> [gateway\_password](#input\_gateway\_password) | The password used for the Ambari Portal. | `string` | n/a | yes |
| <a name="input_ssh_username"></a> [ssh\_username](#input\_ssh\_username) | The username used for the ssh. | `string` | n/a | yes |
| <a name="input_ssh_password"></a> [ssh\_password](#input\_ssh\_password) | The password used for the ssh. | `string` | n/a | yes |
| <a name="input_roles_head_node_vm_size"></a> [roles\_head\_node\_vm\_size](#input\_roles\_head\_node\_vm\_size) | The Size of the Virtual Machine which should be used as the Head Nodes. | `string` | n/a | yes |
| <a name="input_roles_worker_node_number_of_disks_per_node"></a> [roles\_worker\_node\_number\_of\_disks\_per\_node](#input\_roles\_worker\_node\_number\_of\_disks\_per\_node) | The number of Data Disks which should be assigned to each Worker Node. | `number` | `1` | no |
| <a name="input_roles_worker_node_vm_size"></a> [roles\_worker\_node\_vm\_size](#input\_roles\_worker\_node\_vm\_size) | The Size of the Virtual Machine which should be used as the Worker Nodes. | `string` | n/a | yes |
| <a name="input_roles_worker_node_target_instance_count"></a> [roles\_worker\_node\_target\_instance\_count](#input\_roles\_worker\_node\_target\_instance\_count) | The number of instances which should be run for the Worker Nodes. | `number` | n/a | yes |
| <a name="input_roles_zookeeper_node_vm_size"></a> [roles\_zookeeper\_node\_vm\_size](#input\_roles\_zookeeper\_node\_vm\_size) | The Size of the Virtual Machine which should be used as the Zookeeper Nodes. | `string` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | Specifies the Tier which should be used for this HDInsight Cluster. | `string` | n/a | yes |
| <a name="input_metastore_sku"></a> [metastore\_sku](#input\_metastore\_sku) | SKUs to be used for each metastore. | `map(any)` | <pre>{<br>  "ambari": "S0",<br>  "hive": "S0",<br>  "oozie": "S0"<br>}</pre> | no |
| <a name="input_storage_resource_id"></a> [storage\_resource\_id](#input\_storage\_resource\_id) | The ID of the Storage Account. | `string` | n/a | yes |
| <a name="input_filesystem_id"></a> [filesystem\_id](#input\_filesystem\_id) | The ID of the Gen2 Filesystem. | `string` | n/a | yes |
| <a name="input_storage_account_is_default"></a> [storage\_account\_is\_default](#input\_storage\_account\_is\_default) | Is this the Default Storage Account for the HDInsight Hadoop Cluster? | `bool` | `true` | no |
| <a name="input_managed_identity_resource_id"></a> [managed\_identity\_resource\_id](#input\_managed\_identity\_resource\_id) | The ID of Managed Identity to use for accessing the Gen2 filesystem. | `string` | n/a | yes |
| <a name="input_managed_identity_principal_id"></a> [managed\_identity\_principal\_id](#input\_managed\_identity\_principal\_id) | The object ID of Managed Identity to use for accessing the Gen2 filesystem. | `string` | n/a | yes |
| <a name="input_ambari_server_name"></a> [ambari\_server\_name](#input\_ambari\_server\_name) | The external Hive metastore's existing SQL server. | `string` | n/a | yes |
| <a name="input_ambari_database_name"></a> [ambari\_database\_name](#input\_ambari\_database\_name) | The external Hive metastore's existing SQL database. | `string` | n/a | yes |
| <a name="input_ambari_database_administrator_login"></a> [ambari\_database\_administrator\_login](#input\_ambari\_database\_administrator\_login) | The external Ambari metastore's existing SQL server admin username. | `string` | n/a | yes |
| <a name="input_ambari_database_administrator_login_password"></a> [ambari\_database\_administrator\_login\_password](#input\_ambari\_database\_administrator\_login\_password) | The external Ambari metastore's existing SQL server admin password. | `string` | n/a | yes |
| <a name="input_hive_server_name"></a> [hive\_server\_name](#input\_hive\_server\_name) | The external Hive metastore's existing SQL server. | `string` | n/a | yes |
| <a name="input_hive_database_name"></a> [hive\_database\_name](#input\_hive\_database\_name) | The external Hive metastore's existing SQL database. | `string` | n/a | yes |
| <a name="input_hive_database_administrator_login"></a> [hive\_database\_administrator\_login](#input\_hive\_database\_administrator\_login) | The external Hive metastore's existing SQL server admin username. | `string` | n/a | yes |
| <a name="input_hive_database_administrator_login_password"></a> [hive\_database\_administrator\_login\_password](#input\_hive\_database\_administrator\_login\_password) | The external Hive metastore's existing SQL server admin password. | `string` | n/a | yes |
| <a name="input_oozie_server_name"></a> [oozie\_server\_name](#input\_oozie\_server\_name) | The external Hive metastore's existing SQL server. | `string` | n/a | yes |
| <a name="input_oozie_database_name"></a> [oozie\_database\_name](#input\_oozie\_database\_name) | The external Hive metastore's existing SQL database. | `string` | n/a | yes |
| <a name="input_oozie_database_administrator_login"></a> [oozie\_database\_administrator\_login](#input\_oozie\_database\_administrator\_login) | The external Hive metastore's existing SQL server admin username. | `string` | n/a | yes |
| <a name="input_oozie_database_administrator_login_password"></a> [oozie\_database\_administrator\_login\_password](#input\_oozie\_database\_administrator\_login\_password) | The external Hive metastore's existing SQL server admin password. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource identifier of the instance of HDInsight Spark. |
| <a name="output_name"></a> [name](#output\_name) | The name of the HDInsight Spark. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group where the HDInsight Spark exists. |
<!-- END_TF_DOCS -->