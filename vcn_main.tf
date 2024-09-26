resource "oci_core_vcn" "vcns" {
  for_each       = var.vcns
  cidr_block     = each.value.cidr_block
  compartment_id = var.compartment_id
  display_name   = each.key
}

resource "oci_core_subnet" "subnets" {
  for_each = { for idx, subnet in local.subnet_details : idx => subnet }
  cidr_block     = each.value.cidr_block
  vcn_id         = oci_core_vcn[each.value.vcn_key].id
  compartment_id = var.compartment_id
  display_name   = each.value.display_name
  security_list_ids = [oci_core_security_list.security_lists[each.value.vcn_key].id]
  route_table_id    = oci_core_route_table.route_tables[each.value.vcn_key].id
}
