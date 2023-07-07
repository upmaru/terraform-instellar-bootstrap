variable "instellar_auth_token" {}

provider "instellar" {
  host       = "https://staging-web.instellar.app"
  auth_token = var.instellar_auth_token
}

module "instellar_bootstrap" {
  source = "../.."

  cluster_name    = "pizza"
  cluster_address = "127.0.0.1"
  provider_name   = "aws"
  region          = "ap-southeast-1"
  password_token  = "sometoken"

  uplink_channel = "develop"
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