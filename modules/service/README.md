# terraform-instellar-bootstrap
Terraform module for registering components into instellar


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_instellar"></a> [instellar](#requirement\_instellar) | ~> 0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_instellar"></a> [instellar](#provider\_instellar) | 0.6.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [instellar_component.this](https://registry.terraform.io/providers/upmaru/instellar/latest/docs/resources/component) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_channels"></a> [channels](#input\_channels) | Distribution channels that can use this component | `list(string)` | n/a | yes |
| <a name="input_cluster_ids"></a> [cluster\_ids](#input\_cluster\_ids) | The cluster ids to connect to the component | `list(string)` | n/a | yes |
| <a name="input_credential"></a> [credential](#input\_credential) | The credential to use for the component | <pre>object({<br>    username = string<br>    password = string<br>    resource = string<br>    host     = string<br>    port     = number<br>    secure   = bool<br>  })</pre> | n/a | yes |
| <a name="input_driver"></a> [driver](#input\_driver) | The driver to use | `string` | n/a | yes |
| <a name="input_driver_version"></a> [driver\_version](#input\_driver\_version) | The driver version to use | `string` | n/a | yes |
| <a name="input_insterra_component_id"></a> [insterra\_component\_id](#input\_insterra\_component\_id) | The insterra component id of the storage | `number` | `null` | no |
| <a name="input_provider_name"></a> [provider\_name](#input\_provider\_name) | The infrastructure provider | `string` | n/a | yes |
| <a name="input_slug"></a> [slug](#input\_slug) | The slug of the component | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->