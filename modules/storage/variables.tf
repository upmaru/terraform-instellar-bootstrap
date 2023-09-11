variable "host" {
  description = "The host of the storage"
  type        = string
}

variable "bucket" {
  description = "The bucket of the storage"
  type        = string
}

variable "region" {
  description = "The region of the storage"
  type        = string
}

variable "access_key" {
  description = "The access key of the storage"
  type        = string
}

variable "secret_key" {
  description = "The secret key of the storage"
  type        = string
}

variable "insterra_component_id" {
  description = "The insterra component id of the storage"
  type        = number
  nullable    = true
  default     = null
}