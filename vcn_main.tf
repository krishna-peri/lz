provider "oci" {
  # Set your credentials here or use a config file
  tenancy_ocid       = local.tenancy_ocid
  user_ocid          = local.user_ocid
  fingerprint        = local.fingerprint
  private_key_path   = local.private_key_path
  region             = local.region
}



# Create VCNs and Subnets

resource "oci_core_vcn" "vcn" {
  count = length(local.vcn_configs)

  display_name = local.vcn_configs[count.index].local.vcn_configs.vcnname
  cidr_block   = local.vcn_configs[count.index].local.vcn_configs.cidr
  compartment_id = var.tenancy_ocid  # Update to your compartment OCID
  dns_label = local.vcn_configs[count.index].local.vcn_configs.label

    dynamic "subnets" {
      for_each = local.vcn_configs[count.index].subnets
      resource "oci_core_subnet" "subnet" {
      display_name           = subnet.value.name
      cidr_block             = subnet.value.cidr
      compartment_id = var.tenancy_ocid
    }
  }  

}

#output "vcn_ids" {
  #value = oci_core_vcn.vcn.*.id
#}

#output "subnet_ids" {
  #value = oci_core_subnet.subnet.*.id
#}


