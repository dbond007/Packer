#!/bin/sh -eux

case "$PACKER_BUILDER_TYPE" in
vmware-iso|vmware-vmx)
    dnf -y install open-vm-tools;
    echo "platform specific vmware.sh executed";
esac