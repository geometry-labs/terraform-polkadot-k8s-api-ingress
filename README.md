# terraform-polkadot-k8s-api-ingress

[![open-issues](https://img.shields.io/github/issues-raw/geometry-labs/terraform-polkadot-k8s-api-ingress?style=for-the-badge)](https://github.com/geometry-labs/terraform-polkadot-k8s-api-ingress/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/geometry-labs/terraform-polkadot-k8s-api-ingress?style=for-the-badge)](https://github.com/geometry-labs/terraform-polkadot-k8s-api-ingress/pulls)

## Terraform Versions

For Terraform v0.12.0+

## Usage

```hcl-terraform
module "this" {
  source = "github.com/geometry-labs/terraform-polkadot-k8s-api-ingress"
}
```
## Examples

- [defaults](https://github.com/geometry-labs/terraform-polkadot-k8s-api-ingress/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.api](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [template_file.api-values](https://registry.terraform.io/providers/hashicorp/template/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_domain_name"></a> [base\_domain\_name](#input\_base\_domain\_name) | The base domain name for the deployment | `string` | `""` | no |
| <a name="input_cert_manager_enabled"></a> [cert\_manager\_enabled](#input\_cert\_manager\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cloud"></a> [cloud](#input\_cloud) | Name of cloud provider (e.g. 'aws', 'gcp', 'do') | `string` | `""` | no |
| <a name="input_issuer_name"></a> [issuer\_name](#input\_issuer\_name) | n/a | `string` | `"letsencrypt"` | no |
| <a name="input_load_balancer_endpoint"></a> [load\_balancer\_endpoint](#input\_load\_balancer\_endpoint) | Load balancer endpoint to associate with this ingress. | `string` | `""` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | n/a | `string` | `""` | no |
| <a name="input_network_settings"></a> [network\_settings](#input\_network\_settings) | n/a | `map(map(string))` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The region for the deployment | `string` | `""` | no |
| <a name="input_rpc_api_port"></a> [rpc\_api\_port](#input\_rpc\_api\_port) | n/a | `string` | `"9933"` | no |
| <a name="input_wss_api_port"></a> [wss\_api\_port](#input\_wss\_api\_port) | n/a | `string` | `"9944"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [geometry-labs](https://github.com/geometry-labs)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.