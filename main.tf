provider "instellar" {
  host       = var.host
  auth_token = var.auth_token
}

resource "instellar_cluster" "this" {
  name           = var.cluster_name
  provider_name  = var.provider_name
  region         = var.region
  endpoint       = "${var.cluster_address}:${var.cluster_port}"
  password_token = var.password_token
}

resource "instellar_uplink" "this" {
  channel_slug = var.uplink_channel
  cluster_id   = instellar_cluster.this.id
  database_url = var.uplink_database_url
}

resource "instellar_node" "bootstrap" {
  slug      = var.bootstrap_node.slug
  cluster_id = instellar_cluster.this.id
  public_ip = var.bootstrap_node.public_ip
}

resource "instellar_node" "nodes" {
  for_each = {
    for index, node in var.nodes:
      node.slug => node
  }

  slug = each.value.slug
  cluster_id = instellar_cluster.this.id
  public_ip = each.value.public_ip
}

resource "instellar_component" "services" {
  for_each = {
    for index, service in var.services:
      service.slug => service
  }

  name = each.value.slug
  driver = each.value.driver
  driver_version = each.value.driver_version
  cluster_ids = each.value.cluster_ids
  channels = each.value.channels
  credential = each.value.credential
}