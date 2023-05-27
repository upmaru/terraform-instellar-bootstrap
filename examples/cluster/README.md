# Cluster Setup with Uplink

This module will connect instellar to your compute cluster. This module is to be used in tandem with our other provider modules.

Create a `main.tf` file with the following:

```hcl
variable "aws_access_key" {}
variable "aws_secret_key" {}

locals {
  name = "orion-exp"
}

module "compute" {
  source = "upmaru/instellar/aws"
  version = "0.3.6"

  access_key   = var.aws_access_key
  secret_key   = var.aws_secret_key
  cluster_name = local.name
  cluster_topology = [
    {id = 1, name = "apple", size = "c5a.large"},
    {id = 2, name = "watermelon", size = "c5a.large"}
  ]
  
  storage_size = 40

  # Name of key is from your aws console
  # you manually add this via the GUI
  ssh_keys = [
    "zack-studio",
    "zack-one-eight"
  ]
}

variable "instellar_auth_token" {}

module "cluster" {
  source = "uplink/bootstrap/instellar"
  version = "0.2.0"

  host            = "https://staging-web.instellar.app"
  auth_token      = var.instellar_auth_token
  cluster_name    = local.name
  cluster_address = module.compute.public_ip
  provider_name   = "aws"
  region          = module.compute.region
  password_token  = module.compute.trust_token

  uplink_channel      = "master"
  # below value is optional if it's passed in uplink pro will be setup
  # if empty uplink lite will be used.
  uplink_database_url = "postgresql://user:pass@localhost/some_db"
}
```

This example will setup your compute and add it to your instellar account. It will also setup uplink pro because the `uplink_database_url` was defined.

If you choose to omit the `uplink_database_url` the `lite` version of uplink will be setup. Uplink `lite` is limited to single instance, while `pro` can scale to provide HA setup.