resource "instellar_balancer" "this" {
  name       = var.name
  address    = var.address
  cluster_id = var.cluster_id
}