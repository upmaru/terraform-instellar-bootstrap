variable "name" {
  description = "The name of the balancer"
  type        = string
}

variable "address" {
  description = "Address of the balancer to use"
  type        = string
}

variable "cluster_id" {
  description = "The ID of the cluster to attach the balancer to"
  type        = string
}