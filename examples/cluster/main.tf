variable "instellar_host" {}
variable "instellar_auth_token" {}

provider "instellar" {
  host       = var.instellar_host
  auth_token = var.instellar_auth_token
}

module "storage" {
  source = "../../modules/storage"

  host       = "s3.amazonaws.com"
  bucket     = "instellar-staging"
  region     = "ap-southeast-1"
  access_key = "somekey"
  secret_key = "somesecret"
}

module "compute" {
  source = "../.."

  cluster_name    = "pizza-123abc"
  cluster_address = "127.0.0.1"
  provider_name   = "aws"
  region          = "ap-southeast-1"
  password_token  = "sometoken"

  uplink_channel = "develop"
  kit_slug       = "pro"
  # below value is optional if it's passed in uplink pro will be setup
  # if empty uplink lite will be used.

  depends_on = [module.storage]

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
  cluster_ids    = [module.compute.cluster_id]
  channels       = ["develop", "master"]

  certificate = "https://truststore.pki.rds.amazonaws.com/us-east-2/us-east-2-bundle.pem"

  credential = {
    username = "postgres"
    password = "postgres"
    resource = "postgres"
    host     = "localhost"
    port     = 5432
    secure   = true
  }
}

module "mysql_service" {
  source = "../../modules/service"

  slug           = "pizza-mysql"
  provider_name  = "aws"
  driver         = "database/mysql"
  driver_version = "5.7"
  cluster_ids    = [module.compute.cluster_id]
  channels       = ["develop", "master"]

  credential = {
    username = "mysql"
    password = "somepass"
    resource = "exampledb"
    host     = "localhost"
    port     = 3306
    secure   = false
  }
}
