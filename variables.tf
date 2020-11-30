variable "network_settings" {
  description = ""
  type        = map(map(string))
  default     = null
}

variable "network_name" {
  description = ""
  type        = string
  default     = ""
}

variable "rpc_api_port" {
  description = ""
  type        = string
  default     = "9933"
}

variable "wss_api_port" {
  description = ""
  type        = string
  default     = "9944"
}

variable "load_balancer_endpoint" {
  description = "Load balancer endpoint to associate with this ingress."
  type        = string
  default     = ""
}

variable "cert_manager_enabled" {
  description = ""
  type        = bool
  default     = true
}

variable "issuer_name" {
  description = ""
  type        = string
  default     = "letsencrypt"
}

variable "deployment_domain_name" {
  description = "The domain name that will host the deployment"
  type        = string
  default     = ""
}

variable "aggregate_domain_name" {
  description = "The domain name that will be used for the aggregated endpoint"
  type        = string
  default     = ""
}