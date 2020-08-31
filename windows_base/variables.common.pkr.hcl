variable "guest_additions_url" {
  type    = string
  default = ""
}

variable "headless" {
  type    = bool
  default = true
}

locals {
  // fileset lists all files in the http directory as a set, we convert that
  // set to a list of strings and we then take the directory of the first
  // value. This validates that the http directory exists even before starting
  // any builder/provisioner.
  floppy_drivers_directory = dirname(convert(fileset(".", "etc/floppy/drivers/amd64/*"), list(string))[0])
  floppy_scripts_directory = dirname(convert(fileset(".", "etc/floppy/scripts/*"), list(string))[0])
  iso_url_win_2k19                = "[NFS01] ISOs/en_windows_server_2019_updated_feb_2020_x64_dvd_de383770.iso"
  iso_checksum_url_win_2k19       = ""
  iso_url_vmware_tools            = "[NFS01] ISOs/VMware-tools-windows-11.1.1-16303738.iso"
  iso_checksum_url_vmware_tools   = ""
  iso_url_vmware_drivers          = "[NFS01] ISOs/VMware_pvscsi.iso"
  iso_checksum_url_vmware_drivers = ""
  win_2k19_boot_command           = ["<enter>","<enter>"]
}