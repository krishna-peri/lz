locals {
  vcn_configs = [
    {
      name   = "iad-vcn-dmz"
      cidr   = "135.136.129.0/26"
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
      subnets = [
        { name = "iad-sn-np-openam-lb", cidr= "135.136.129.128/29" },
        { name = "iad-sn-np-openam-web", cidr= "135.136.129.144/29" },
        { name = "iad-sn-np-openam-app", cidr= "135.136.129.152/29" },
        { name = "iad-sn-pd-openam-lb", cidr= "135.136.129.160/29" },
        { name = "iad-sn-pd-openam-web", cidr= "135.136.129.168/29" },
        { name = "iad-sn-pd-openam-app", cidr= "135.136.129.176/29" } ,
        { name = "iad-sn-pd-ad-app", cidr= "135.136.129.184/29" },
        { name = "iad-sn-np-nca-lb", cidr= "135.136.129.192/29" },
        { name = "iad-sn-np-nca-app", cidr= "135.136.129.200/29" },
        { name = "iad-sn-pd-nca-lb", cidr= "135.136.129.208/29" },
        { name = "iad-sn-pd-nca-app", cidr= "135.136.129.216/29" },
        { name = "iad-sn-pd-dns-app", cidr= "135.136.129.224/29" },
        { name = "iad-sn-oem", cidr= "135.136.129.136/29" }
      ]
    },
    {
      name   = "iad-vcn-pd-custportal"
      cidr   = "135.136.130.0/26"
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
      subnets = [
        { name = "subnet2-1", cidr = "10.1.1.0/24" },
        { name = "subnet2-2", cidr = "10.1.2.0/24" }
      ]
    },
    {
      name   = "iad-vcn-pd-soup"
      cidr   = "135.136.130.128/26"
      subnets = [
        { name = "subnet1-1", cidr = "10.0.1.0/24" },
        { name = "subnet1-2", cidr = "10.0.2.0/24" }
      ]
    },
    {
      name   = "iad-vcn-np-custportal"
      cidr   = "135.136.132.0/26"
      subnets = [
        { name = "subnet1-1", cidr = "10.0.1.0/24" },
        { name = "subnet1-2", cidr = "10.0.2.0/24" }
      ]
    },
{
      name   = "iad-vcn-np-macc"
      cidr   = "135.136.132.128/26"
      subnets = [
        { name = "subnet1-1", cidr = "10.0.1.0/24" },
        { name = "subnet1-2", cidr = "10.0.2.0/24" }
      ]
    },
      name   = "iad-vcn-np-soup"
      cidr   = "135.136.133.0/25"
      subnets = [
        { name = "subnet1-1", cidr = "10.0.1.0/24" },
        { name = "subnet1-2", cidr = "10.0.2.0/24" }
      ]
    },
  ]
}
