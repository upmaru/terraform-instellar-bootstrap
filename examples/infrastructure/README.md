# Cluster Setup with Uplink

This module will connect instellar to your compute cluster. This module is to be used in tandem with our other provider modules.

Create a `main.tf` file with the following:

```hcl
variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
  default = "us-west-2"
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

locals {
  name = "orion-exp"
}

module "primary_compute" {
  source = "upmaru/instellar/aws"
  version = "0.3.6"

  access_key   = var.aws_access_key
  secret_key   = var.aws_secret_key

  provider_name = local.provider_name
  cluster_name  = local.name

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

provider "instellar" {
  host       = "https://staging-web.instellar.app"
  auth_token = var.instellar_auth_token
}

module "primary_cluster" {
  source = "uplink/bootstrap/instellar"
  version = "~> 0.4"

  cluster_name    = local.name
  cluster_address = module.compute.public_ip
  provider_name   = "aws"
  region          = module.compute.region
  password_token  = module.compute.trust_token

  uplink_channel      = "master"
  # below value is optional if it's passed in uplink pro will be setup
  # if empty uplink lite will be used.
  uplink_database_url = "postgresql://user:pass@localhost/some_db"

   bootstrap_node = {
    slug      = "something"
    public_ip = "127.0.0.1"
  }

  nodes = [
    {
      slug      = "another-one"
      public_ip = "22.33.44.66"
    },
    {
      slug      = "and-another"
      public_ip = "55.66.77.88"
    }
  ]
}

module "postgresql_service" {
  source = "../../modules/service"

  slug           = "pizza-postgresql"
  provider_name  = "aws"
  driver         = "database/postgresql"
  driver_version = "15"
  cluster_ids    = [module.instellar_bootstrap.cluster_id]
  channels       = ["develop", "master"]

  credential = {
    username = "postgres"
    password = "postgres"
    database = "postgres"
    host     = "localhost"
    port     = 5432
  }
}

module "mysql_service" {
  source = "../../modules/service"

  slug           = "pizza-mysql"
  provider_name  = "aws"
  driver         = "database/mysql"
  driver_version = "5.7"
  cluster_ids    = [module.instellar_bootstrap.cluster_id]
  channels       = ["develop", "master"]

  credential = {
    username = "mysql"
    password = "somepass"
    database = "exampledb"
    host     = "localhost"
    port     = 3306
  }
}
```

This example will setup your compute and add it to your instellar account. It will also setup uplink pro because the `uplink_database_url` was defined.

If you choose to omit the `uplink_database_url` the `lite` version of uplink will be setup. Uplink `lite` is limited to single instance, while `pro` can scale to provide HA setup.

You can also create database services and associate it to your cluster see the `postgresql_service` and `mysql_service` module as an example.