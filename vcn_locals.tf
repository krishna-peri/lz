locals {
  tenancy_ocid       = "ocid1.compartment.oc1..aaaaaaaafgnmba62o5ubvvkxmjzvagaeefs7wp6xcquh36bapdhctmndcpaa"
  user_ocid          = "ocid1.user.oc1..aaaaaaaar5kjd23bf23pfa2o2u3x7fnxhxhlielljk3f3ql2cxqj545g3coa"
  fingerprint        = "b6:a0:fc:23:3c:45:53:f7:90:7f:53:df:b7:7d:85:0a"
  private_key_path   = "kp.pem"
  region             = "us-ashburn-1"
  ###comp_ocid       =  "ocid1.compartment.oc1..aaaaaaaafgnmba62o5ubvvkxmjzvagaeefs7wp6xcquh36bapdhctmndcpaa"

  
  vcn_configs = [
    {
      vcnname   = "iad-vcn-dmz"
      cidr   = "135.136.129.0/26"
      dns_label = "iaddmz"
      subnets = [
        { name = "iad-sn-mgmt-pub" cidr = "135.136.129.0/29" },
        { name = "iad-sn-ha-prv" cidr = "135.136.129.8/29" },
        { name = "iad-sn-trust-prv" cidr = "135.136.129.16/29" },
        { name = "iad-sn-untrust-pub" cidr = "135.136.129.32/28" }
      ]
    }
    
  
list_egress_security_dest             = "0.0.0.0/0"
list_egress_security_protocol_dest    = "all"
list_ingress_security_source          = "0.0.0.0/0"
list_ingress_security_protocol_source = "all"

}
