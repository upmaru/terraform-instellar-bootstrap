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
    resource = string
    host     = string
    port     = number
    secure   = bool
  })
  description = "The credential to use for the component"
}

variable "certificate" {
  description = "Any certificate URL or PEM from the service"
  type        = string
  default     = null
}

variable "insterra_component_id" {
  description = "The insterra component id of the storage"
  type        = number
  default     = null
}
