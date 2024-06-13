variable "rg" {}
variable "nsg" {}
variable "security_rules" {}
variable "vnet" {}
variable "subnet" {
  type = map(object({
    name             = string
    address_prefixes = string
  }))
}
variable "pip" {}
variable "nic" {}
variable "vm" {}
variable "my_lb" {}
variable "blb" {}
variable "blip" {
  type = map(any)
}
variable "kv" {}
variable "key_secret" {}
variable "bastion-host" {}