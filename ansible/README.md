# Kubespray repo

Установить один из вариантов kubespray:

``` bash
git clone https://github.com/kubernetes-sigs/kubespray.git
git clone https://github.com/southbridgeio/kubespray.git
```

Установить зависимости:

``` bash
cd kubespray
sudo pip3 install -r requirements.txt
rm -rf ../environments/group_vars
cp -rfp inventory/sample/group_vars ../environments
```
