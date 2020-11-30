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

resource "kubernetes_service" "api_proxy" {
  for_each = local.network_settings
  metadata {
    name = "api-proxy-${each.value["name"]}"
  }
  spec {
    type          = "ExternalName"
    external_name = var.load_balancer_endpoint
  }
}

resource "kubernetes_ingress" "api-proxy" {
  for_each = local.network_settings

  # two conditions for "metadata"
  # either SSL is enabled or it's not
  # if it's not, we only need the ingress class annotation

  dynamic "metadata" {
    for_each = ! var.cert_manager_enabled ? [each.value] : []
    content {
      name = "api-proxy-ingress-${each.value["name"]}"
      annotations = {
        "kubernetes.io/ingress.class" = "nginx"
      }
    }
  }

  # if SSL is enabled, then we need to also include the certificate issuer annotation

  dynamic "metadata" {
    for_each = var.cert_manager_enabled ? [each.value] : []
    content {
      name = "api-proxy-ingress-${each.value["name"]}"
      annotations = {
        "kubernetes.io/ingress.class" = "nginx"
        "cert-manager.io/cluster-issuer" : var.issuer_name
      }
    }
  }

  # for spec, it's a bit more complicated, since we need dynamic blocks for SSL and aggregate domains

  # first, we do NO SSL
  # and first without an aggregate domain
  dynamic "spec" {
    for_each = ! var.cert_manager_enabled && var.aggregate_domain_name == "" ? [each.value] : []
    content {
      rule {
        host = "api.${each.value["name"]}.${var.deployment_domain_name}"
        http {
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["json_rpc"]
            }
            path = "/v0"
          }
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["ws_rpc"]
            }
            path = "/"
          }
        }
      }
    }
  }

  # now with an aggregate domain
  dynamic "spec" {
    for_each = ! var.cert_manager_enabled && var.aggregate_domain_name != "" ? [each.value] : []
    content {
      rule {
        host = "api.${each.value["name"]}.${var.deployment_domain_name}"
        http {
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["json_rpc"]
            }
            path = "/v0"
          }
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["ws_rpc"]
            }
            path = "/"
          }
        }
      }
      rule {
        host = "api.${each.value["name"]}.${var.aggregate_domain_name}"
        http {
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["json_rpc"]
            }
            path = "/v0"
          }
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["ws_rpc"]
            }
            path = "/"
          }
        }
      }
    }
  }

  # SSL, but no aggregated domain

  dynamic "spec" {
    for_each = var.cert_manager_enabled && var.aggregate_domain_name == "" ? [each.value] : []
    content {
      tls {
        hosts       = ["api.${var.deployment_domain_name}"]
        secret_name = "api-proxy-${each.value["name"]}-tls"
      }
      rule {
        host = "api.${each.value["name"]}.${var.deployment_domain_name}"
        http {
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["json_rpc"]
            }
            path = "/v0"
          }
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["ws_rpc"]
            }
            path = "/"
          }
        }
      }
    }
  }

  # SSL and aggregated domain

  dynamic "spec" {
    for_each = var.cert_manager_enabled && var.aggregate_domain_name != "" ? [each.value] : []
    content {
      tls {
        hosts       = ["api.${var.deployment_domain_name}", "api.${var.aggregate_domain_name}"]
        secret_name = "api-proxy-${each.value["name"]}-tls"
      }
      rule {
        host = "api.${each.value["name"]}.${var.deployment_domain_name}"
        http {
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["json_rpc"]
            }
            path = "/v0"
          }
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["ws_rpc"]
            }
            path = "/"
          }
        }
      }
      rule {
        host = "api.${each.value["name"]}.${var.aggregate_domain_name}"
        http {
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["json_rpc"]
            }
            path = "/v0"
          }
          path {
            backend {
              service_name = "api-proxy-${each.value["name"]}"
              service_port = each.value["ws_rpc"]
            }
            path = "/"
          }
        }
      }
    }
  }
}