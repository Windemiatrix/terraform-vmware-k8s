data "vsphere_virtual_machine" "template" {
  name          = var.vm-template-name
  datacenter_id = data.vsphere_datacenter.dc.id
}
resource "vsphere_virtual_machine" "master-node" {
  count            = 2
  name             = "${var.vm-name}-MasterNode-${count.index}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus  = var.vm-MasterNode-count
  memory    = 4096
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "${var.vm-name}-MasterNode-${count.index + 1}-disk"
    size  = 10
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      timeout = 30

      linux_options {
        host_name = "${var.vm-name}-MasterNode-${count.index + 1}"
        domain    = var.vm-domain
      }

      network_interface {}
    }
  }
}

resource "vsphere_virtual_machine" "worker-node" {
  count            = var.vm-WorkerNode-count
  name             = "${var.vm-name}-WorkerNode-${count.index + 1}"
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
    label = "${var.vm-name}-WorkerNode-${count.index + 1}-disk"
    size  = 10
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      timeout = 30

      linux_options {
        host_name = "${var.vm-name}-WorkerNode-${count.index + 1}"
        domain    = var.vm-domain
      }

      network_interface {
        ipv4_address = ""
      }
    }
  }
}
