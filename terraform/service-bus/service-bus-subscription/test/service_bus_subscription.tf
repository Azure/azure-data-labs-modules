module "service_bus_subscription" {
  source   = "../"
  basename = random_string.postfix.result
  topic_id = module.local_service_bus_topic.id
}

# Module dependencies

module "local_service_bus_topic" {
  source = "../../service-bus-topic/test"
}