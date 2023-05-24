provider "instellar" {
  host       = var.host
  auth_token = var.auth_token
}

resource "instellar_cluster" "main" {
  name           = var.cluster_name
  provider_name  = var.provider_name
  region         = var.region
  endpoint       = "${var.cluster_address}:${var.cluster_port}"
  password_token = var.password_token
}