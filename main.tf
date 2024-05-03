resource "instellar_cluster" "this" {
  name                  = var.cluster_name
  provider_name         = var.provider_name
  region                = var.region
  endpoint              = "${var.cluster_address}:${var.cluster_port}"
  password_token        = var.password_token
  insterra_component_id = var.insterra_component_id
}

resource "instellar_uplink" "this" {
  channel_slug = var.uplink_channel
  kit_slug     = var.kit_slug
  cluster_id   = instellar_cluster.this.id
}

resource "instellar_node" "bootstrap" {
  slug       = var.bootstrap_node.slug
  cluster_id = instellar_cluster.this.id
  public_ip  = var.bootstrap_node.public_ip
}

resource "instellar_node" "nodes" {
  for_each = {
    for index, node in var.nodes :
    node.slug => node
  }

  slug       = each.value.slug
  cluster_id = instellar_cluster.this.id
  public_ip  = each.value.public_ip
}

resource "instellar_balancer" "this" {
  count = var.balancer.enabled ? 1 : 0

  depends_on = [
    var.balancer.dependencies
  ]

  name       = var.balancer.name
  address    = var.balancer.address
  cluster_id = instellar_cluster.this.id
}