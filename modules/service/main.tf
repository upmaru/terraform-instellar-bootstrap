resource "instellar_component" "this" {
  name           = var.slug
  driver         = var.driver
  driver_version = var.driver_version
  cluster_ids    = var.cluster_ids
  channels       = var.channels
  provider_name  = var.provider_name

  credential {
    username = var.credential.username
    password = var.credential.password
    database = var.credential.database
    host     = var.credential.host
    port     = var.credential.port
  }
}