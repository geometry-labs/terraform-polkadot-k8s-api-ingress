locals {
  network_settings = var.network_settings == null ? { network = {
    name                = var.network_name
    shortname           = null
    api_health          = null
    polkadot_prometheus = null
    json_rpc            = var.rpc_api_port
    ws_rpc              = var.wss_api_port
  } } : var.network_settings
}

resource "template_file" "api-values" {
  for_each = local.network_settings
  template = file("${path.module}/values.yaml")
  vars = {
    ssl_enabled            = var.cert_manager_enabled
    cluster_issuer         = var.issuer_name
    name                   = each.value["name"]
    short_name             = each.value["shortname"]
    deployment_domain_name = "api.${var.region}.${each.value["name"]}.${var.base_domain_name}"
    aggregate_domain_name  = "api.${each.value["name"]}.${var.base_domain_name}"
    ws_upstream_uri        = "${var.load_balancer_endpoint}:${each.value["ws_rpc"]}"
    rpc_upstream_uri       = var.load_balancer_endpoint
  }
}

resource "helm_release" "api" {
  for_each   = template_file.api-values
  chart      = "polkadot-api"
  name       = "${each.key}-api"
  repository = "https://insight-infrastructure.github.io/charts/"
  values     = [template_file.api-values[each.key].rendered]
}