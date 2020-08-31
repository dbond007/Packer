build {
  name = "windows"
  description = <<EOF
This build creates windows images for windows versions :
* 2019 Standard
* 2019 Standard Core
For the following builers :
* vsphere-iso
EOF

  // the common fields of the source blocks are defined in the
  // source.builder-type.pkr.hcl files, here we only set the fields specific to
  // the different versions of centos.
    source "source.vsphere-iso.base-windows-amd64" {
        name                    = "2019std_core"
        vm_name                 = "windows2k19std-core"
        #iso_url                 = local.iso_url_win_2k19
        #iso_checksum            = "file:${local.iso_checksum_url_win_2k19}"
        boot_command            = local.win_2k19_boot_command
        #http_directory          = local.http_directory
        iso_paths = [
            local.iso_url_win_2k19,
            local.iso_url_vmware_tools,
            local.iso_url_vmware_drivers
        ]
            floppy_files = [
            local.floppy_drivers_directory,
            local.floppy_scripts_directory,
            local.win2k19std_core_unattend
        ]
    }

    source "source.vsphere-iso.base-windows-amd64" {
        name                    = "2019std"
        vm_name                 = "windows2k19std"
        #iso_url                 = local.iso_url_win_2k19
        #iso_checksum            = "file:${local.iso_checksum_url_win_2k19}"
        boot_command            = local.win_2k19_boot_command
        #http_directory          = local.http_directory
        iso_paths = [
            local.iso_url_win_2k19,
            local.iso_url_vmware_tools,
            local.iso_url_vmware_drivers
        ]
        floppy_files = [
            local.floppy_drivers_directory,
            local.floppy_scripts_directory,
            local.win2k19std_unattend
        ]

    }
    
    provisioner "powershell" {
        scripts           = fileset(".", "etc/scripts/*.ps1")
    }
}