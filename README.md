# terraform-instellar-bootstrap
Terraform module for bootstrapping cluster on instellar.app

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_instellar"></a> [instellar](#requirement\_instellar) | ~> 0.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_instellar"></a> [instellar](#provider\_instellar) | 0.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [instellar_cluster.this](https://registry.terraform.io/providers/upmaru/instellar/latest/docs/resources/cluster) | resource |
| [instellar_node.bootstrap](https://registry.terraform.io/providers/upmaru/instellar/latest/docs/resources/node) | resource |
| [instellar_node.nodes](https://registry.terraform.io/providers/upmaru/instellar/latest/docs/resources/node) | resource |
| [instellar_uplink.this](https://registry.terraform.io/providers/upmaru/instellar/latest/docs/resources/uplink) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bootstrap_node"></a> [bootstrap\_node](#input\_bootstrap\_node) | The bootstrap node detail | <pre>object({<br>    slug      = string<br>    public_ip = string<br>  })</pre> | n/a | yes |
| <a name="input_cluster_address"></a> [cluster\_address](#input\_cluster\_address) | Public facing IP of the cluster | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the cluster | `string` | n/a | yes |
| <a name="input_cluster_port"></a> [cluster\_port](#input\_cluster\_port) | Port of the cluster | `number` | `8443` | no |
| <a name="input_insterra_component_id"></a> [insterra\_component\_id](#input\_insterra\_component\_id) | The insterra component id of the storage | `number` | `null` | no |
| <a name="input_kit_slug"></a> [kit\_slug](#input\_kit\_slug) | The slug of the kit to use. lite \| pro | `string` | `"lite"` | no |
| <a name="input_nodes"></a> [nodes](#input\_nodes) | Other nodes detail | <pre>list(<br>    object({<br>      slug      = string<br>      public_ip = string<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_password_token"></a> [password\_token](#input\_password\_token) | The trust token of the cluster | `string` | n/a | yes |
| <a name="input_provider_name"></a> [provider\_name](#input\_provider\_name) | The infrastructure provider | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of your cluster | `string` | n/a | yes |
| <a name="input_uplink_channel"></a> [uplink\_channel](#input\_uplink\_channel) | Which distribution channel to use | `string` | `"master"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
<!-- END_TF_DOCS -->