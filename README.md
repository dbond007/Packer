# Packer
Packer templates for vmware

Fill in the required vars in the example pkrvar file and run

packer build -var-file="variables.pkrvars.hcl" .

in the directory of the OS you want.

## Variability in ESXi host boot speed

You may need to edit the boot_wait time in source.vsphere-iso.pkr.hcl to get it to enter the commands at the correct time.
The current settings work for me on my home system, but at work, I need to reduce the wait time as those systems boot / start the VM far quicker.