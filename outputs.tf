output "cluster_id" {
  value = instellar_cluster.this.id
}

output "uplink_nodes" {
  value = data.instellar_uplink.this.nodes
}