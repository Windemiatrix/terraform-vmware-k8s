data "vsphere_virtual_machine" "template" {
  name          = var.vm-template-name
  datacenter_id = data.vsphere_datacenter.dc.id
}
resource "vsphere_virtual_machine" "vm" {
  count            = 10
  name             = "${var.vm-name}-${count.index}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus  = 2
  memory    = 4096
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "${var.vm-name}-${count.index}-disk"
    size  = 25
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      timeout = 30

      linux_options {
        host_name = "${var.vm-name}-${count.index}"
        domain    = var.vm-domain
      }

      network_interface {}
    }
  }
}
