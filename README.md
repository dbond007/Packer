# Packer
Packer templates for vmware

Fill in the required vars in the example pkrvar file and run

packer build -var-file="variables.pkrvars.hcl" .

in the directory of the OS you want.

## Variability in ESXi host boot speed

You may need to edit the boot_wait time in source.vsphere-iso.pkr.hcl to get it to enter the commands at the correct time.
The current settings work for me on my home system, but at work, I need to reduce the wait time as those systems boot / start the VM far quicker.

## Snapshots

All the templates created have "create_snapshot = true". This allows the template to be used to create thin clones, meaning new VMs based upon these templates can start up without copying any data, so starts within seconds.

This thin cloning can be done in terraform and in vsphere-clone. Adding "linked_clone = true" in the vsphere-clone source is all that is needed when using these templates.

Note: due to the way vmware handles templates and snapshots, you will not be able to delete a template with a snapshot, it must first be converted to a virtual machine, then it can be deleted.

