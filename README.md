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