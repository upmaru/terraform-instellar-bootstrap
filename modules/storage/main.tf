resource "instellar_storage" "this" {
  host                  = var.host
  bucket                = var.bucket
  region                = var.region
  access_key_id         = var.access_key
  secret_access_key     = var.secret_key
  insterra_component_id = var.insterra_component_id
}