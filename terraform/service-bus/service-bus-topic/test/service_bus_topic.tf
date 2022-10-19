module "service_bus_topic" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/service-bus/service-bus-topic"

  basename     = random_string.postfix.result
  namespace_id = module.local_service_bus_namespace.id
}

# Module dependencies

module "local_service_bus_namespace" {
  source = "../../service-bus-namespace/test"
}