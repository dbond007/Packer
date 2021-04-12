#!/bin/sh -eux
#https://kb.vmware.com/s/article/59687 - SED section, to ensure dbus starts before vmware tools
case "$PACKER_BUILDER_TYPE" in
vmware-iso|vmware-vmx|vsphere-iso|vsphere-clone)
    apt-get install -y open-vm-tools;
    mkdir /mnt/hgfs;
    sed '/\[Unit\]/a After=dbus.service' /lib/systemd/system/open-vm-tools.service > /tmp/open-vm-tools.service
    sudo cp /tmp/open-vm-tools.service /lib/systemd/system/open-vm-tools.service
    rm /tmp/open-vm-tools.service
    systemctl enable open-vm-tools
    systemctl start open-vm-tools
    echo "platform specific vmware.sh executed";
esac