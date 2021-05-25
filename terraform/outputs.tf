output "MasterNode_default_ips" {
  description = "The default IP address of each virtual machine deployed, indexed by name."

  value = (zipmap(
    flatten([
      tolist(vsphere_virtual_machine.master-node.*.name),
      tolist(vsphere_virtual_machine.worker-node.*.name),
      tolist(vsphere_virtual_machine.ingress.*.name)
    ]),
    flatten([
      tolist(vsphere_virtual_machine.master-node.*.default_ip_address),
      tolist(vsphere_virtual_machine.worker-node.*.default_ip_address),
      tolist(vsphere_virtual_machine.ingress.*.default_ip_address)
    ]),
  ))
}

output "MasterNode_default_mac" {
  description = "The default IP address of each virtual machine deployed, indexed by name."

  value = (zipmap(
    flatten([
      tolist(vsphere_virtual_machine.master-node.*.name),
      tolist(vsphere_virtual_machine.worker-node.*.name),
      tolist(vsphere_virtual_machine.ingress.*.name)
    ]),
    flatten([
      tolist(vsphere_virtual_machine.master-node.*.network_interface.0.mac_address),
      tolist(vsphere_virtual_machine.worker-node.*.network_interface.0.mac_address),
      tolist(vsphere_virtual_machine.ingress.*.network_interface.0.mac_address)
    ]),
  ))
}
