provider "oci" {
  # Set your credentials here or use a config file
  tenancy_ocid       = local.tenancy_ocid
  user_ocid          = local.user_ocid
  fingerprint        = local.fingerprint
  private_key_path   = local.private_key_path
  region             = local.region
}



# Create VCNs and Subnets

# Loop to create VCNs
resource "oci_core_vcn" "vcn" {
  for_each = { for vcn in local.vcn_configs : vcn.name => vcn }

  display_name = each.value.name
  cidr_block   = each.value.cidr
  compartment_id = var.tenancy_ocid  # Update to your compartment OCID
  dns_label = each.value.dns_label
  
}
module "intermediate_module" {
  count  = var.should_create ? 1 : 0
  source = "./conditional_module"
  properties = var.properties
}

# Loop to create Subnets
resource "oci_core_subnet" "subnet" {
  for_each = { for vcn in local.vcn_configs :vcn.name => {for subnet in vcn.subnets :subnet.name => subnet } }

  ###count = length(local.vcn_configs)
  display_name = each.value[0].name
  cidr_block   = each.value[0].cidr
  vcn_id       = oci_core_vcn.vcn[each.key].id
  compartment_id = var.tenancy_ocid  # Update to your compartment OCID


  }

output "vcn_ids" {
  value = oci_core_vcn.vcn.*.id
}

output "subnet_ids" {
  value = oci_core_subnet.subnet.*.id
}


output "subnets_name" {
value = { for vcn in local.vcn_configs :vcn.name => {for subnet in vcn.subnets :subnet.name => subnet }
 }
}
