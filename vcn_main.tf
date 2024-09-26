resource "oci_core_vcn" "vcn" {
foreach = { for v in var.vcns : v.name => v }
  cidr_block     = each.value.cidr_block
  compartment_id = local.tenancy_ocid
  display_name   = each.value.name
  dns_label      = each.value.vcn_label
}

locals {

flat_vcn_configurations = merge([
         for vcn_config in var.vcns :
         {
             for subnet in vcn_config["subnet"]:
             "${vcn_config["name"]}-${subnet["name"]}" =>
              {
                  name = vcn_config["name"]
                  subnet_name = subnet["name"]
                  cidr_block = subnet["cidr_block"]
                  type = subnet["is_public"]
              }
         }
      ]...)
}

resource "oci_core_subnet" "subnets" {
  #for_each = { for v in var.vcns , s in v.subnets : "${v.name}-${s.name}" => "s" }
  for_each= local.flat_vcn_configurations
  vcn_id     = oci_core_vcn.vcn[(each.key)[0]].id
  cidr_block     = each.value.cidr_block
  compartment_id = local.tenancy_ocid
  display_name   = each.value.name
  prohibit_public_ip_on_vnic = each.value.type
  
}

