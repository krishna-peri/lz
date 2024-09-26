resource "oci_core_vcn" "vcns" {
  for_each       = local.vcns
  cidr_block     = each.value.cidr_block
  compartment_id = var.compartment_id
  display_name   = each.key
}
