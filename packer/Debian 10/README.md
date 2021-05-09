# Packer templates for vmware

Thanks to [guillermo-musumeci](https://github.com/guillermo-musumeci/packer-vsphere-iso-linux/tree/master/Debian-10).

To create template execute:

``` bash
packer build -var-file variables.json debian10.json
```

Credentials: `ladmin`/`InstallPassword`.

> Don't forget to change it during deploying!

Minimum system requirements for install:

- RAM: 1024;
- HDD: 4096 (system size after install is 2.6 Gb).
