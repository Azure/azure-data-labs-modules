module "service_bus_subscription" {
  source = "git::https://github.com/microsoft/azure-labs-modules.git//terraform/service-bus/service-bus-subscription"

  basename = random_string.postfix.result
  topic_id = module.local_service_bus_topic.id
}

# Module dependencies

module "local_service_bus_topic" {
  source = "../../service-bus-topic/test"
}