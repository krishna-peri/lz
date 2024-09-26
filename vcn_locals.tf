locals {
  tenancy_ocid       = "ocid1.compartment.oc1..aaaaaaaafgnmba62o5ubvvkxmjzvagaeefs7wp6xcquh36bapdhctmndcpaa"
  user_ocid          = "ocid1.user.oc1..aaaaaaaar5kjd23bf23pfa2o2u3x7fnxhxhlielljk3f3ql2cxqj545g3coa"
  fingerprint        = "b6:a0:fc:23:3c:45:53:f7:90:7f:53:df:b7:7d:85:0a"
  private_key_path   = "kp.pem"
  region             = "us-ashburn-1"
  ###comp_ocid       =  "ocid1.compartment.oc1..aaaaaaaafgnmba62o5ubvvkxmjzvagaeefs7wp6xcquh36bapdhctmndcpaa"


 flat_vcn_configurations = merge([
         for vcn_config in var.vcns :
         {
             for subnet in vcn_config["subnet"]:
             "${vcn_config["name"]}-${subnet["name"]}" =>
              {
                  name = vcn_config["name"]
                  subnet_name = subnet["name"]
                  cidr_block = subnet["cidr_block"]
                  is_public - subnet["is_public"]
              }
         }
      ]...)
}
