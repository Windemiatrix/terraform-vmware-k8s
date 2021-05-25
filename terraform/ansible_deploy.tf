resource "null_resource" "deploy_docker" {
  provisioner "local-exec" {
    command = "ansible-playbook ../ansible/docker/install.yml"
  }
  depends_on = [
    vsphere_virtual_machine.master-node,
    vsphere_virtual_machine.worker-node,
    local_file.AnsibleInventory
  ]
}

resource "null_resource" "deploy_kubespray" {
  provisioner "local-exec" {
    command = "ansible-playbook --become  ../ansible/kubespray/cluster.yml"
  }
  depends_on = [
    vsphere_virtual_machine.master-node,
    vsphere_virtual_machine.worker-node,
    local_file.AnsibleInventory,
    null_resource.deploy_docker,
  ]
}
