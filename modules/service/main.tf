resource "instellar_component" "this" {
  name                  = var.slug
  driver                = var.driver
  driver_version        = var.driver_version
  cluster_ids           = var.cluster_ids
  channels              = var.channels
  provider_name         = var.provider_name
  insterra_component_id = var.insterra_component_id
  credential {
    username    = var.credential.username
    password    = var.credential.password
    resource    = var.credential.resource
    certificate = var.certificate
    host        = var.credential.host
    port        = var.credential.port
    secure      = var.credential.secure
  }
}
