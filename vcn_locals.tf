locals {
  tenancy_ocid       = "ocid1.compartment.oc1..aaaaaaaafgnmba62o5ubvvkxmjzvagaeefs7wp6xcquh36bapdhctmndcpaa"
  user_ocid          = "ocid1.user.oc1..aaaaaaaar5kjd23bf23pfa2o2u3x7fnxhxhlielljk3f3ql2cxqj545g3coa"
  fingerprint        = "b6:a0:fc:23:3c:45:53:f7:90:7f:53:df:b7:7d:85:0a"
  private_key_path   = "kp.pem"
  region             = "us-ashburn-1"
  ###comp_ocid       =  "ocid1.compartment.oc1..aaaaaaaafgnmba62o5ubvvkxmjzvagaeefs7wp6xcquh36bapdhctmndcpaa"

  vcns = {
 iad-vcn-dmz = {
      cidr_block = "135.136.129.0/26"
      vcn_label = iaddmz
      subnets = {
        subnet1 = {
          cidr_block   = "135.136.129.0/29"
          display_name = "iad-sn-np-openam-lb"
          type = public
        }
        subnet2 = {
          cidr_block   = "135.136.129.8/29"
          display_name = "Subnet2_VCN1"
          type = private
        }
      }
    }
  }


subnet_details = flatten([
    for vcn_key, vcn in local.vcns : [
      for subnet_key, subnet in vcn.subnets : {
        vcn_key       = vcn_key
        subnet_key    = subnet_key
        cidr_block    = subnet.cidr_block
        display_name  = subnet.display_name
        type          = subnet.type
      }
    ]
  ])
    
  
list_egress_security_dest             = "0.0.0.0/0"
list_egress_security_protocol_dest    = "all"
list_ingress_security_source          = "0.0.0.0/0"
list_ingress_security_protocol_source = "all"

}
