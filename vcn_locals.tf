locals {
  tenancy_ocid       = "ocid1.tenancy.oc1..aaaaaaaacr2kimui4s25ck7zeyjrqvfc3bpyjlr73hjrydgukzwcwqctbqra"
  user_ocid          = "ocid1.user.oc1..aaaaaaaar5kjd23bf23pfa2o2u3x7fnxhxhlielljk3f3ql2cxqj545g3coa"
  fingerprint        = "b6:a0:fc:23:3c:45:53:f7:90:7f:53:df:b7:7d:85:0a"
  private_key_path   = "kp.pem"
  region             = "us-ashburn-1"
  comp_ocid       =  "ocid1.compartment.oc1..aaaaaaaafgnmba62o5ubvvkxmjzvagaeefs7wp6xcquh36bapdhctmndcpaa"

  
  vcn_configs = [
    {
      name   = "iad-vcn-dmz"
      cidr   = "135.136.129.0/26"
      dns_label = "iaddmz"
      subnets = [
        { name = "iad-sn-mgmt-pub", cidr = "135.136.129.0/29" },
        { name = "iad-sn-ha-prv", cidr = "135.136.129.8/29" },
        { name = "iad-sn-trust-prv", cidr = "10.0.1.0/24" },
        { name = "iad-sn-trust-prv", cidr = "135.136.129.32/28" }
      ]
    },
    {
      name   = "iad-vcn-platform"
      cidr   = "135.136.129.128/25"
      dns_label = "iadplatform"
      subnets = [
        { name = "iad-sn-np-openam-lb", cidr = "135.136.129.128/29" },
        { name = "iad-sn-np-openam-web", cidr = "135.136.129.144/29" },
        { name = "iad-sn-np-openam-app", cidr = "135.136.129.152/29" },
        { name = "iad-sn-pd-openam-lb", cidr = "135.136.129.160/29" },
        { name = "iad-sn-pd-openam-web", cidr = "135.136.129.168/29" },
        { name = "iad-sn-pd-openam-app", cidr = "135.136.129.176/29" } ,
        { name = "iad-sn-pd-ad-app", cidr = "135.136.129.184/29" },
        { name = "iad-sn-np-nca-lb", cidr = "135.136.129.192/29" },
        { name = "iad-sn-np-nca-app", cidr = "135.136.129.200/29" },
        { name = "iad-sn-pd-nca-lb", cidr = "135.136.129.208/29" },
        { name = "iad-sn-pd-nca-app", cidr = "135.136.129.216/29" },
        { name = "iad-sn-pd-dns-app", cidr = "135.136.129.224/29" },
        { name = "iad-sn-oem", cidr = "135.136.129.136/29" }
      ]
    },
    {
      name   = "iad-vcn-pd-custportal"
      cidr   = "135.136.130.0/26"
      dns_label = "iadpdcustportal"
      subnets = [
        { name = "iad-sn-pd-custportal-db", cidr = "135.136.130.0/27" },
        { name = "iad-sn-pd-custportal-lb", cidr = "135.136.130.32/29" },
        { name = "iad-sn-pd-custportal-web", cidr = "135.136.130.40/29" },
        { name = "iad-sn-pd-custportal-app", cidr = "135.136.130.48/29" }
      ]
    },
    
    {
      name   = "iad-vcn-pd-macc"
      cidr   = "135.136.130.64/26"
      dns_label = "iadpdmacc"
      subnets = [
        { name = "subnet2-1", cidr = "10.1.1.0/24" },
        { name = "subnet2-2", cidr = "10.1.2.0/24" }
      ]
    },
    {
      name   = "iad-vcn-pd-soup"
      cidr   = "135.136.130.128/26"
      dns_label = "iadpdsoup"
      subnets = [
        { name =  "iad-sn-pd-soup-db",cidr = "135.136.130.128/29"},
        { name =  "iad-sn-pd-soup-lb",cidr = "135.136.130.144/28"},
        { name =  "iad-sn-pd-soup-app",cidr = "135.136.130.160/28"}
      ]
    },
    {
      name   = "iad-vcn-np-custportal"
      cidr   = "135.136.132.0/26"
      dns_label = "iadnpcustportal"
      subnets = [
        { name = "iad-sn-np-custportal-db",cidr = "135.136.132.0/26" },
        { name = "iad-sn-np-custportal-lb",cidr = "135.136.132.16/26" },
        { name = "iad-sn-np-custportal-web",cidr = "135.136.132.32/26" },
        { name = "iad-sn-np-custportal-app",cidr = "135.136.132.48/26" }
      ]
    },
{
      name   = "iad-vcn-np-macc"
      cidr   = "135.136.132.128/26"
      dns_label = "iadnpmacc"
      subnets = [
        { name = "iad-sn-np-macc-db", cidr = "135.136.132.128/28" },
        { name = "iad-sn-np-macc-lb", cidr = "135.136.132.144/28" },
        { name = "iad-sn-np-macc-app", cidr = "135.136.132.160/28" }
      ]
    },
{
      name   = "iad-vcn-np-soup"
      cidr   = "135.136.133.0/25"
      dns_label = "iadnpsoup"
      subnets = [
        { name = "iad-sn-np-soup-db",cidr = "135.136.133.0/28" },
        { name = "iad-sn-np-soup-lb",cidr = "135.136.133.32/28" },
        { name = "iad-sn-np-soup-app",cidr = "135.136.133.64/27" }
      ]
    }
]
  
list_egress_security_dest             = "0.0.0.0/0"
list_egress_security_protocol_dest    = "all"
list_ingress_security_source          = "0.0.0.0/0"
list_ingress_security_protocol_source = "all"

}
