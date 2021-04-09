provider "kubernetes" {
  config_path = "~/.kube/config" # Be careful! - `minikube start`
}

module "defaults" {
  source = "../.."
  network_settings = {
    polkadot = {
      name = "polkadot"
      shortname = "polkadot"
      api_health = "5000"
      polkadot_prometheus = "9610"
      json_rpc = "9933"
      ws_rpc = "9944"
    }
    kusama = {
      name = "kusama"
      shortname = "ksmcc3"
      api_health = "5001"
      polkadot_prometheus = "9611"
      json_rpc = "9934"
      ws_rpc = "9945"
    }
  }
}
