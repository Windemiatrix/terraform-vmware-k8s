resource "local_file" "AnsibleInventory" {
  content  = <<-EOT
[all]
%{for node in vsphere_virtual_machine.master-node.*~}
${node.name} ansible_host=${node.default_ip_address} ip=${node.default_ip_address} access_ip=${node.default_ip_address} ansible_user=ubuntu ansible_password=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no' ansible_python_interpreter='python3'
%{endfor~}
%{for node in vsphere_virtual_machine.worker-node.*~}
${node.name} ansible_host=${node.default_ip_address} ip=${node.default_ip_address} access_ip=${node.default_ip_address} ansible_user=ubuntu ansible_password=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no' ansible_python_interpreter='python3'
%{endfor~}
%{for node in vsphere_virtual_machine.ingress.*~}
${node.name} ansible_host=${node.default_ip_address} ip=${node.default_ip_address} access_ip=${node.default_ip_address} ansible_user=ubuntu ansible_password=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no' ansible_python_interpreter='python3'
%{endfor~}

[kube_control_plane]
%{for node in vsphere_virtual_machine.master-node.*~}
${node.name}
%{endfor~}

[etcd]
%{for node in vsphere_virtual_machine.master-node.*~}
${node.name}
%{endfor~}

[kube-node]
%{for node in vsphere_virtual_machine.worker-node.*~}
${node.name}
%{endfor~}

[kube-ingress]
%{for node in vsphere_virtual_machine.ingress.*~}
${node.name}
%{endfor~}

[calico-rr]

[k8s-cluster:children]
kube_control_plane
kube-node
calico-rr
EOT
  filename = "../ansible/environments/inventory"
  depends_on = [
    vsphere_virtual_machine.master-node,
    vsphere_virtual_machine.worker-node,
  ]
}
