# Variables
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "vcns" {
  type = map(object({
    cidr_block = string
    subnets = map(object({
      cidr_block = string
      display_name = string
      type = string # "public" or "private"
    }))
  }))


