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


# Loop to create Subnets
resource "oci_core_subnet" "subnet" {
  for_each = { for idx, subnet in local.subnet_list : idx => subnet }
  cidr_block     = each.value.cidr_block
  vcn_id         = oci_core_vcn.vcn.id
  compartment_id = var.tenancy_ocid
  display_name   = each.value.display_name

  }





