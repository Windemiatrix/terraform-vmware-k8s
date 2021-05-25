# Creation containerization infrastructure in VMWare cloud

## Create VMWare VM template with Packer

Unfortunately, not all distributives and operation systems supports changing configuration during creating virtual machine from template. List of supported distributives and operation systems you can find [here](https://partnerweb.vmware.com/programs/guestOS/guest-os-customization-matrix.pdf).

Copy variables file from example and change it:

``` bash
cd packer/<DistrName>/
cp variables.json.example variables.json
vi variables.json
```

And run deployment:

``` bash
cd packer/<DistrName>/
packer build -var-file variables.json packer.json
```

## Create VMWare VM instance with Terraform

Copy variables file from example and change it:

``` bash
cd terraform/
cp variables.tfvars.example variables.tfvars
vi variables.tfvars
```

And run deployment:

``` bash
cd terraform/
terraform plan
terraform apply
```

> Terraform after successful creating instances run Ansible provisioner with installing `Docker` and kubernetes cluster

## Install Docker

Inventory file should be generated with Terraform. Nothing to change, just run deployment:

``` bash
cd terradorm
ansible-playbook ../ansible/docker/install.yml
```

## Install Kubernetes with kubespray

Please, check [official documentation](https://github.com/kubernetes-sigs/kubespray/blob/release-2.15/README.md) for configuring Kubespray.

> `group_vars` should be placed in `ansible/environments`, inventory will be generated with `Terraform`

Run deployment:

``` bash
cd terraform/
ansible-playbook --become  ../ansible/kubespray/cluster.yml
```
