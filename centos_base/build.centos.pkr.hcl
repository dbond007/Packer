build {
  name = "centos"
  description = <<EOF
This build creates ubuntu images for centos versions :
* 8.3
For the following builers :
* vsphere-iso
EOF

  // the common fields of the source blocks are defined in the
  // source.builder-type.pkr.hcl files, here we only set the fields specific to
  // the different versions of centos.
    source "source.vsphere-iso.base-centos-amd64" {
    name                    = "8.3"
    vm_name                 = "centos-8.3"
    iso_url                 = local.iso_url_centos_83
    iso_checksum            = "file:${local.iso_checksum_url_centos_83}"
    boot_command            = local.centos_83_boot_command
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