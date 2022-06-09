variable "resource_group_name" {
  type = string
}
variable "tenant_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}
variable "client_secret" {
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