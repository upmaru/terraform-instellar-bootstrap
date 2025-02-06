variable "provider_name" {
  type        = string
  description = "The infrastructure provider"
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster"
}

variable "cluster_address" {
  type        = string
  description = "Public facing IP of the cluster"
}

variable "password_token" {
  type        = string
  description = "The trust token of the cluster"
}

variable "cluster_port" {
  type        = number
  description = "Port of the cluster"
  default     = 8443
}

variable "uplink_channel" {
  type        = string
  description = "Which distribution channel to use"
  default     = "master"
}

variable "kit_slug" {
  type        = string
  description = "The slug of the kit to use. lite | pro"
  default     = "lite"
}

variable "region" {
  type        = string
  description = "Region of your cluster"
}

variable "bootstrap_node" {
  description = "The bootstrap node detail"
  type = object({
    slug      = string
    public_ip = string
  })
}

variable "nodes" {
  description = "Other nodes detail"
  type = list(
    object({
      slug      = string
      public_ip = string
    })
  )
}

variable "balancer" {
  description = "Whether the balancer is active"
  type = object({
    enabled      = bool
    name         = optional(string)
    address      = optional(string)
    dependencies = list(string)
  })
  default = {
    enabled      = false
    name         = null
    address      = null
    dependencies = []
  }
}

variable "insterra_component_id" {
  description = "The insterra component id of the storage"
  type        = number
  nullable    = true
  default     = null
}