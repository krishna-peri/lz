provider "oci" {
  # Set your credentials here or use a config file
  tenancy_ocid       = var.tenancy_ocid
  user_ocid          = var.user_ocid
  fingerprint        = var.fingerprint
  private_key_path   = var.private_key_path
  region             = var.region
}



# Create VCNs and Subnets
locals {
  vcn_configs = [
    {
      name   = "vcn1"
      cidr   = "10.0.0.0/16"
      subnets = [
        { name = "subnet1-1", cidr = "10.0.1.0/24" },
        { name = "subnet1-2", cidr = "10.0.2.0/24" }
      ]
    },
    {
      name   = "vcn2"
      cidr   = "10.1.0.0/16"
      subnets = [
        { name = "subnet2-1", cidr = "10.1.1.0/24" },
        { name = "subnet2-2", cidr = "10.1.2.0/24" }
      ]
    }
  ]
}

# Loop to create VCNs
resource "oci_virtual_network" "vcn" {
  for_each = { for vcn in local.vcn_configs : vcn.name => vcn }

  display_name = each.value.name
  cidr_block   = each.value.cidr
  compartment_id = var.tenancy_ocid  # Update to your compartment OCID
}

# Loop to create Subnets
resource "oci_subnet" "subnet" {
  for_each = {
    for vcn in local.vcn_configs :
    vcn.name => {
      for subnet in vcn.subnets :
      subnet.name => subnet
    }
  }
  count = length(local.vcn_configs)

  display_name = each.value[0].name
  cidr_block   = each.value[0].cidr
  vcn_id       = oci_virtual_network.vcn[each.key].id
  compartment_id = var.tenancy_ocid  # Update to your compartment OCID
  availability_domain = var.availability_domain # Update with your AD
}

output "vcn_ids" {
  value = oci_virtual_network.vcn.*.id
}

output "subnet_ids" {
  value = oci_subnet.subnet.*.id
}
