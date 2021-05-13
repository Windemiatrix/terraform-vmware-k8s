variable "vsphere_user" {
  default     = ""
  description = "VSphere user"
}

variable "vsphere_password" {
  default     = ""
  description = "VSphere password"
}

variable "vsphere_server" {
  default     = ""
  description = "VSphere server"
}

variable "vm-name" {
  default     = ""
  description = "Virtual machine name"
}

variable "vm-template-name" {
  default     = ""
  description = "Virtual machine template name"
}

variable "vsphere-template-dir" {
  default     = ""
  description = "VSphere directory with templates"
}

variable "vsphere-datacenter" {
  default     = ""
  description = "VSphere datacenter name"
}

variable "vm-domain" {
  default     = ""
  description = "Domain name"
}

variable "vm-MasterNode-count" {
  default     = ""
  description = "Domain name"
}

variable "vm-WorkerNode-count" {
  default     = ""
  description = "Domain name"
}
