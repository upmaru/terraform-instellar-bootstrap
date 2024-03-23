<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_instellar"></a> [instellar](#requirement\_instellar) | ~> 0.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_instellar"></a> [instellar](#provider\_instellar) | 0.8.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [instellar_balancer.this](https://registry.terraform.io/providers/upmaru/instellar/latest/docs/resources/balancer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address"></a> [address](#input\_address) | Address of the balancer to use | `string` | n/a | yes |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the cluster to attach the balancer to | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the balancer | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->