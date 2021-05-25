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

variable "vsphere-datastore" {
  default     = ""
  description = "VSphere datastore name"
}

variable "vm-domain" {
  default     = ""
  description = "Domain name"
}

variable "vm-MasterNode-count" {
  default     = 3
  description = "Domain name"
}

variable "vm-MasterNode-CPUs" {
  default     = 2
  description = "Domain name"
}

variable "vm-MasterNode-RAM" {
  default     = 4096
  description = "Domain name"
}

variable "vm-MasterNode-ROM" {
  default     = 10
  description = "Domain name"
}

variable "vm-WorkerNode-count" {
  default     = 2
  description = "Domain name"
}

variable "vm-WorkerNode-CPUs" {
  default     = 2
  description = "Domain name"
}

variable "vm-WorkerNode-RAM" {
  default     = 4096
  description = "Domain name"
}

variable "vm-WorkerNode-ROM" {
  default     = 10
  description = "Domain name"
}

variable "vm-Ingress-count" {
  default     = 1
  description = "Domain name"
}

variable "vm-Ingress-CPUs" {
  default     = 1
  description = "Domain name"
}

variable "vm-Ingress-RAM" {
  default     = 2048
  description = "Domain name"
}

variable "vm-Ingress-ROM" {
  default     = 10
  description = "Domain name"
}
