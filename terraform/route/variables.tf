variable "resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "name" {
  type        = string
  description = "The name of the Route."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,80}$", var.name)) && can(regex("[\\w]+$", var.name)) && can(regex("^[0-9a-zA-Z]+", var.name))
    error_message = "The name must be betwen 1 and 80 characters,  must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "route_table_name" {
  type        = string
  description = "The name of the route table within which create the route."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,80}$", var.route_table_name)) && can(regex("[0-9a-zA-Z]+$", var.route_table_name)) && can(regex("^[0-9a-zA-Z]+", var.route_table_name))
    error_message = "Name must be between 1 and 80 characters and start and end with a letter or number. You can use characters '-', '.', '_'."
  }
}

variable "address_prefix" {
  type        = string
  description = "The destination to which the route applies."
  validation {
    condition     = can(regex("^(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9])[.]){3}(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9]))\\/([0-9]|[12][0-9]|3[0-2])$", var.address_prefix)) || contains(["actiongroup", "apimanagement", "applicationinsightsavailability", "appconfiguration", "appservice", "appservicemanagement", "autonomousdevelopmentplatform", "azureactivedirectory", "azureactivedirectorydomainservices", "azureadvancedthreatprotection", "azurearcinfrastructure", "azureattestation", "azurebackup", "azurebotservice", "azurecloud", "azurecognitivesearch", "azureconnectors", "azurecontainerappsservice", "azurecontainerregistry", "azurecosmosdb", "azuredatabricks", "azuredataexplorermanagement", "azuredatalake", "azuredeviceupdate", "azuredevspaces", "azuredevops", "azuredigitaltwins", "azureeventgrid", "azurefrontdoor.frontend", "azurefrontdoor.backend", "azurefrontdoor.firstparty", "azurehealthcareapis", "azureinformationprotection", "azureiothub", "azurekeyvault", "azureloadbalancer", "azureloadtestinginstancemanagement", "azuremachinelearning", "azuremonitor", "azureopendatasets", "azureplatformdns", "azureplatformimds", "azureplatformlkm", "azureresourcemanager", "azuresentinel", "azuresignalr", "azuresiterecovery", "azuresphere", "azurestack", "azuretrafficmanager", "azureupdatedelivery", "azurewebpubsub", "batchnodemanagement", "chaosstudio", "cognitiveservicesmanagement", "datafactory", "datafactorymanagement", "dynamics365formarketingemail", "dynamics365businesscentral", "eopexternalpublishedips", "eventhub", "gatewaymanager", "guestandhybridmanagement", "hdinsight", "internet", "logicapps", "logicappsmanagement", "m365managementactivityapi", "m365managementactivityapiwebhook", "microsoftazurefluidrelay", "microsoftcloudappsecurity", "microsoftcontainerregistry", "microsoftdefenderforendpoint", "powerbi", "powerplatforminfra", "powerplatformplex", "powerqueryonline", "servicebus", "servicefabric", "sql", "sqlmanagement", "storage", "storagesyncservice", "windowsadmincenter", "windowsvirtualdesktop", "virtualnetwork"], lower(var.address_prefix))
    error_message = "Invalid address prefix. It must be either a valida IP range in CIDR format or one of the following Azure Service Tags: \"ActionGroup\", \"ApiManagement\", \"ApplicationInsightsAvailability\", \"AppConfiguration\", \"AppService\", \"AppServiceManagement\", \"AutonomousDevelopmentPlatform\", \"AzureActiveDirectory\", \"AzureActiveDirectoryDomainServices\", \"AzureAdvancedThreatProtection\", \"AzureArcInfrastructure\", \"AzureAttestation\", \"AzureBackup\", \"AzureBotService\", \"AzureCloud\", \"AzureCognitiveSearch\", \"AzureConnectors\", \"AzureContainerAppsService\", \"AzureContainerRegistry\", \"AzureCosmosDB\", \"AzureDatabricks\", \"AzureDataExplorerManagement\", \"AzureDataLake\", \"AzureDeviceUpdate\", \"AzureDevSpaces\", \"AzureDevOps\", \"AzureDigitalTwins\", \"AzureEventGrid\", \"AzureFrontDoor.Frontend\", \"AzureFrontDoor.Backend\", \"AzureFrontDoor.FirstParty\", \"AzureHealthcareAPIs\", \"AzureInformationProtection\", \"AzureIoTHub\", \"AzureKeyVault\", \"AzureLoadBalancer\", \"AzureLoadTestingInstanceManagement\", \"AzureMachineLearning\", \"AzureMonitor\", \"AzureOpenDatasets\", \"AzurePlatformDNS\", \"AzurePlatformIMDS\", \"AzurePlatformLKM\", \"AzureResourceManager\", \"AzureSentinel\", \"AzureSignalR\", \"AzureSiteRecovery\", \"AzureSphere\", \"AzureStack\", \"AzureTrafficManager\", \"AzureUpdateDelivery\", \"AzureWebPubSub\", \"BatchNodeManagement\", \"ChaosStudio\", \"CognitiveServicesManagement\", \"DataFactory\", \"DataFactoryManagement\", \"Dynamics365ForMarketingEmail\", \"Dynamics365BusinessCentral\", \"EOPExternalPublishedIPs\", \"EventHub\", \"GatewayManager\", \"GuestAndHybridManagement\", \"HDInsight\", \"Internet\", \"LogicApps\", \"LogicAppsManagement\", \"M365ManagementActivityApi\", \"M365ManagementActivityApiWebhook\", \"MicrosoftAzureFluidRelay\", \"MicrosoftCloudAppSecurity\", \"MicrosoftContainerRegistry\", \"MicrosoftDefenderForEndpoint\", \"PowerBI\", \"PowerPlatformInfra\", \"PowerPlatformPlex\", \"PowerQueryOnline\", \"ServiceBus\", \"ServiceFabric\", \"Sql\", \"SqlManagement\", \"Storage\", \"StorageSyncService\", \"WindowsAdminCenter\", \"WindowsVirtualDesktop\", \"VirtualNetwork\"."
  }
}

variable "next_hop_type" {
  type        = string
  description = "The type of Azure hop the packet should be sent to."
  validation {
    condition     = contains(["virtualnetworkgateway", "vnetlocal", "internet", "virtualappliance", "none"], lower(var.next_hop_type))
    error_message = "Valid values for next_hop_type are \"VirtualNetworkGateway\", \"VnetLocal\", \"Internet\", \"VirtualAppliance\", \"None\"."
  }
}