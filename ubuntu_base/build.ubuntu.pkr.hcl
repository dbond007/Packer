build {
  name = "ubuntu"
  description = <<EOF
This build creates ubuntu images for ubuntu versions :
* 18.04
* 20.04
* 20.10
* 21.04
For the following builers :
* vsphere-iso
EOF

  // the common fields of the source blocks are defined in the
  // source.builder-type.pkr.hcl files, here we only set the fields specific to
  // the different versions of ubuntu.
    source "source.vsphere-iso.base-ubuntu-amd64" {
    name                    = "18.04"
    vm_name                 = "ubuntu-18.04"
    iso_url                 = local.iso_url_ubuntu_1804
    iso_checksum            = "file:${local.iso_checksum_url_ubuntu_1804}"
    boot_command            = local.ubuntu_1804_boot_command
    http_directory          = local.http_directory
  }
  
  source "source.vsphere-iso.base-ubuntu-amd64" {
    name                    = "20.04"
    vm_name                 = "ubuntu-20.04"
    iso_url                 = local.iso_url_ubuntu_2004
    iso_checksum            = "file:${local.iso_checksum_url_ubuntu_2004}"
    boot_command            = local.ubuntu_2004_boot_command
    http_directory          = local.http_directory
  }

  source "source.vsphere-iso.base-ubuntu-amd64" {
    name                    = "20.10"
    vm_name                 = "ubuntu-20.10-${local.clean_time}"
    boot_command            = local.ubuntu_2010_boot_command
    http_directory          = local.http_directory
    iso_url                 = local.iso_url_ubuntu_2010
    iso_checksum            = "file:${local.iso_checksum_url_ubuntu_2010}"
  }

  source "source.vsphere-iso.base-ubuntu-amd64" {
    name                    = "21.04"
    vm_name                 = "ubuntu-21.04-${local.clean_time}"
    iso_url                 = local.iso_url_ubuntu_2104
    iso_checksum            = "file:${local.iso_checksum_url_ubuntu_2104}"
    boot_command            = local.ubuntu_2104_boot_command
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