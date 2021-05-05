# Packer templates for vmware

Thanks to [guillermo-musumeci](https://github.com/guillermo-musumeci/packer-vsphere-iso-linux/tree/master/Debian-10).

To create template execute:

``` bash
cd Debian\ 10
packer build -var-file variables.json debian10.json
```

Credentials: `ladmin`/`InstallPassword`.

> Don't forget to change it during deploying!
