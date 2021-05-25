data "vsphere_virtual_machine" "template" {
  name          = var.vm-template-name
  datacenter_id = data.vsphere_datacenter.dc.id
}
resource "vsphere_virtual_machine" "master-node" {
  count            = var.vm-MasterNode-count
  name             = "${var.vm-name}-master-${count.index + 1}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus  = var.vm-MasterNode-CPUs
  memory    = var.vm-MasterNode-RAM
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "${var.vm-name}-master-${count.index + 1}-disk"
    size  = var.vm-MasterNode-ROM
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      timeout = 30

      linux_options {
        host_name = "${var.vm-name}-master-${count.index + 1}"
        domain    = var.vm-domain
      }

      network_interface {}
    }
  }
}

resource "vsphere_virtual_machine" "worker-node" {
  count            = var.vm-WorkerNode-count
  name             = "${var.vm-name}-node-${count.index + 1}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus  = var.vm-WorkerNode-CPUs
  memory    = var.vm-WorkerNode-RAM
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "${var.vm-name}-node-${count.index + 1}-disk"
    size  = var.vm-WorkerNode-ROM
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      timeout = 30

      linux_options {
        host_name = "${var.vm-name}-node-${count.index + 1}"
        domain    = var.vm-domain
      }

      network_interface {
        ipv4_address = ""
      }
    }
  }
}

resource "vsphere_virtual_machine" "ingress" {
  count            = var.vm-Ingress-count
  name             = "${var.vm-name}-ingress-${count.index + 1}"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.ds.id

  num_cpus  = var.vm-Ingress-CPUs
  memory    = var.vm-Ingress-RAM
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "${var.vm-name}-ingress-${count.index + 1}-disk"
    size  = var.vm-Ingress-ROM
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      timeout = 30

      linux_options {
        host_name = "${var.vm-name}-ingress-${count.index + 1}"
        domain    = var.vm-domain
      }

      network_interface {
        ipv4_address = ""
      }
    }
  }
}
