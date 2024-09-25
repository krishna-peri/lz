provider "oci" {
  # Set your credentials here or use a config file
  user_ocid          = local.user_ocid
  fingerprint        = local.fingerprint
  private_key_path   = local.private_key_path
  region             = local.region
}



# Create VCNs and Subnets

# Loop to create VCNs
resource "oci_virtual_network" "vcn" {
  for_each = { for vcn in local.vcn_configs : vcn.name => vcn }

  display_name = each.value.name
  cidr_block   = each.value.cidr
  compartment_id = var.comp_ocid  # Update to your compartment OCID
  dns_label = each.value.dns_label
  
}

# Loop to create Subnets
resource "oci_subnet" "subnet" {
  for_each = { for vcn in local.vcn_configs :vcn.name => {for subnet in vcn.subnets :subnet.name => subnet }
 }
  ###count = length(local.vcn_configs)

  display_name = each.value[0].name
  cidr_block   = each.value[0].cidr
  vcn_id       = oci_virtual_network.vcn[each.key].id
  compartment_id = var.comp_ocid  # Update to your compartment OCID
  
}

output "vcn_ids" {
  value = oci_virtual_network.vcn.*.id
}

output "subnet_ids" {
  value = oci_subnet.subnet.*.id
}
