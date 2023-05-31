variable "instellar_auth_token" {}

module "instellar" {
  source = "../.."

  host            = "https://staging-web.instellar.app"
  auth_token      = var.instellar_auth_token
  cluster_name    = "pizza"
  cluster_address = "127.0.0.1"
  provider_name   = "aws"
  region          = "ap-southeast-1"
  password_token  = "sometoken"

  uplink_channel      = "develop"
  # below value is optional if it's passed in uplink pro will be setup
  # if empty uplink lite will be used.
  uplink_database_url = "postgresql://user:pass@localhost/some_db"

  bootstrap_node = {
    slug = "something"
    public_ip = "127.0.0.1"
  }

  nodes = [
    {
      slug = "another-one"
      public_ip = "22.33.44.66"
    },
    {
      slug = "and-another"
      public_ip = "55.66.77.88"
    }
  ]
}