build {
  name = "rocky"
  description = <<EOF
This build creates rocky linux versions :
* 8.4
For the following builers :
* vsphere-iso
EOF

  // the common fields of the source blocks are defined in the
  // source.builder-type.pkr.hcl files, here we only set the fields specific to
  // the different versions of rocky.
    source "source.vsphere-iso.base-rocky-amd64" {
    name                    = "8.4"
    vm_name                 = "rocky-8.4-${local.clean_time}"
    iso_url                 = local.iso_url_rocky_84
    iso_checksum            = "file:${local.iso_checksum_url_rocky_84}"
    boot_command            = local.rocky_84_boot_command
    http_directory          = local.http_directory
  }

  provisioner "shell" {
    environment_vars  = [ "HOME_DIR=/home/packer" ]
    execute_command   = "echo 'vagrant' | {{.Vars}} sudo -S -E sh -eux '{{.Path}}'"
    expect_disconnect = true
    // fileset will list files in etc/scripts sorted in an alphanumerical way.
    scripts           = fileset(".", "etc/scripts/*.sh")
  }
}