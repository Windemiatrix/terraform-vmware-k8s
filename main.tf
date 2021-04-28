provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Voek.com"
}

data "vsphere_datastore" "datastore_122" {
  name          = "LocalDS(192.168.51.122)"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore_123" {
  name          = "LocalDS(192.168.51.123)"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore_omega" {
  name          = "Omega"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "VOEK/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}
