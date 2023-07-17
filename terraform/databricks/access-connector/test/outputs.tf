output "ua_id" {
  value = module.access_connector_system_identity.id
}

output "ua_identity" {
  value = module.access_connector_system_identity.identity
}

output "sa_id" {
  value = module.access_connector_user_identity.id
}

output "sa_identity" {
  value = module.access_connector_user_identity.identity
}
