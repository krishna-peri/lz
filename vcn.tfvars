variable "vcn_configs" {
  type = list(object({
    vcnname     = string
    cidr = string
    dns_label = string
    subnets = list(object({
      name    = string
      cidr = string
    }))
  }))
}
