resource "oci_core_vcn" "vcn" {
foreach = { for v in var.vcns : v.name => v }
  cidr_block     = each.value.cidr_block
  compartment_id = local.tenancy_ocid
  display_name   = each.value.name
  dns_label      = each.value.vcn_label
}

resource "oci_core_subnet" "subnets" {
  for_each = { for v in var.vcns , s in v.subnets : "${v.name}-${s.name}" => "s" }
  vcn_id     = oci_core_vcn.vcn[(each.key)[0]].id
  cidr_block     = each.value.cidr_block
  compartment_id = local.tenancy_ocid
  display_name   = each.value.name
  prohibit_public_ip_on_vnic = each.value.type
  
}

