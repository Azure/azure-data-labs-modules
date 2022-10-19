module "service_bus_queue" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/service-bus/service-bus-queue"

  basename     = random_string.postfix.result
  namespace_id = module.local_service_bus_namespace.id
}

# Module dependencies

module "local_service_bus_namespace" {
  source = "../../service-bus-namespace/test"
}