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

resource "instellar_uplink" "main" {
  channel_slug = var.uplink_channel
  cluster_id   = instellar_cluster.main.id
  database_url = var.uplink_database_url
}