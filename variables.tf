variable "host" {
  type        = string
  description = "Instellar host"
  default     = "https://web.instellar.app"
}

variable "auth_token" {
  type        = string
  description = "Authentication token for instellar"
}

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

variable "uplink_database_url" {
  type        = string
  description = "Database to use for uplink pro"
  default     = null
}

variable "region" {
  type        = string
  description = "Region of your cluster"
}