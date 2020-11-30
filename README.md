# terraform-polkadot-k8s-api-ingress

[![open-issues](https://img.shields.io/github/issues-raw/insight-w3f/terraform-polkadot-k8s-api-ingress?style=for-the-badge)](https://github.com/insight-w3f/terraform-polkadot-k8s-api-ingress/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-w3f/terraform-polkadot-k8s-api-ingress?style=for-the-badge)](https://github.com/insight-w3f/terraform-polkadot-k8s-api-ingress/pulls)

## Terraform Versions

For Terraform v0.12.0+

## Usage

```hcl-terraform
module "this" {
  source = "github.com/insight-w3f/terraform-polkadot-k8s-api-ingress"
}
```
## Examples

- [defaults](https://github.com/insight-w3f/terraform-polkadot-k8s-api-ingress/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| kubernetes | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aggregate\_domain\_name | The domain name that will be used for the aggregated endpoint | `string` | `""` | no |
| cert\_manager\_enabled | n/a | `bool` | `true` | no |
| deployment\_domain\_name | The domain name that will host the deployment | `string` | `""` | no |
| issuer\_name | n/a | `string` | `"letsencrypt"` | no |
| load\_balancer\_endpoint | Load balancer endpoint to associate with this ingress. | `string` | `""` | no |
| network\_name | n/a | `string` | `""` | no |
| network\_settings | n/a | `map(map(string))` | `null` | no |
| rpc\_api\_port | n/a | `string` | `"9933"` | no |
| wss\_api\_port | n/a | `string` | `"9944"` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [insight-w3f](https://github.com/insight-w3f)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.