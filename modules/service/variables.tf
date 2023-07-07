variable "provider_name" {
  type        = string
  description = "The infrastructure provider"
}

variable "slug" {
  type        = string
  description = "The slug of the component"
}

variable "driver" {
  type        = string
  description = "The driver to use"
}

variable "driver_version" {
  type        = string
  description = "The driver version to use"
}

variable "cluster_ids" {
  type        = list(string)
  description = "The cluster ids to connect to the component"
}

variable "channels" {
  type        = list(string)
  description = "Distribution channels that can use this component"
}

variable "credential" {
  type = object({
    username = string
    password = string
    database = string
    host     = string
    port     = number
  })
  description = "The credential to use for the component"
}