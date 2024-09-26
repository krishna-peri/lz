variable vcns = {
description = "List of VCN"
type        = list(map(any))
default = [
      name  = "iad-vcn-dmz" 
      cidr_block = "135.136.129.0/26"
      vcn_label = "iaddmz"
      subnets = [
        {
        name = "iad-sn-np-openam-lb"
        cidr_block   = "135.136.129.0/29"
        is_public = false
        }
          
      {
        name = "Subnet2_VCN1"          
        cidr_block   = "135.136.129.8/29"
        is_public = true  
      }
      ]
    ]
  }
