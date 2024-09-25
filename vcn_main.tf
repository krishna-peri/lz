provider "oci" {
  # Set your credentials here or use a config file
  tenancy_ocid       = var.tenancy_ocid
  user_ocid          = var.user_ocid
  fingerprint        = var.fingerprint
  private_key_path   = var.private_key_path
  region             = var.region
}



# Create VCNs and Subnets

# Loop to create VCNs
resource "oci_virtual_network" "vcn" {
  for_each = { for vcn in local.vcn_configs : vcn.name => vcn }

  display_name = each.value.name
  cidr_block   = each.value.cidr
  compartment_id = var.tenancy_ocid  # Update to your compartment OCID
}

# Loop to create Subnets
resource "oci_subnet" "subnet" {
  for_each = { for vcn in local.vcn_configs :vcn.name => {for subnet in vcn.subnets :subnet.name => subnet }
  }
  count = length(local.vcn_configs)

  display_name = each.value[0].name
  cidr_block   = each.value[0].cidr
  vcn_id       = oci_virtual_network.vcn[each.key].id
  compartment_id = var.tenancy_ocid  # Update to your compartment OCID
  availability_domain = var.availability_domain # Update with your AD
}

resource "oci_core_security_list" "security_list" {
     provider       = oci.variable
    compartment_id = var.env_compartment_ocid
    vcn_id = var.vnc_ocid
    display_name = var.display_name

    # #Optional
    # defined_tags = {"Operations.CostCenter"= "42"}
    # display_name = var.security_list_display_name
    egress_security_rules {
        #Required
        destination = var.list_egress_security_dest
        protocol = var.list_egress_security_protocol_dest
        }
    ingress_security_rules {
        #Required
        source = var.list_ingress_security_source
        protocol = var.list_ingress_security_protocol_source
        
        }

}


output "vcn_ids" {
  value = oci_virtual_network.vcn.*.id
}

output "subnet_ids" {
  value = oci_subnet.subnet.*.id
}
