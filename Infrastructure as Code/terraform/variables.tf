variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string

}

variable "vm_size" {
  type    = string
  default = "Standard_B2_s"
}

variable "db_location" {
  type = string
  default = "eastasia"
}
variable "ssh_key" {
  type = string
} 

# #########################################################################
# # Terraform gets these values from ENV variables set during execution.###
# # This variables is not needed when azure executes pipline            ###
# #########################################################################
# variable "tenant_id" {
#   type = string
# }

# variable "subscription_id" {
#   type = string
# }

# variable "client_id" {
#   type = string
# }
# variable "client_secret" {
#   type = string
# }
