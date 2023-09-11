<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_instellar"></a> [instellar](#requirement\_instellar) | ~> 0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_instellar"></a> [instellar](#provider\_instellar) | ~> 0.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [instellar_storage.this](https://registry.terraform.io/providers/upmaru/instellar/latest/docs/resources/storage) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | The access key of the storage | `string` | n/a | yes |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The bucket of the storage | `string` | n/a | yes |
| <a name="input_host"></a> [host](#input\_host) | The host of the storage | `string` | n/a | yes |
| <a name="input_insterra_component_id"></a> [insterra\_component\_id](#input\_insterra\_component\_id) | The insterra component id of the storage | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region of the storage | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | The secret key of the storage | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->