module "service_bus_topic" {
  source       = "../"
  basename     = random_string.postfix.result
  namespace_id = module.local_service_bus_namespace.id
}

# Module dependencies

module "local_service_bus_namespace" {
  source = "../../service-bus-namespace/test"
}