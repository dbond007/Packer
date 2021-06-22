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
  clean_time                      = formatdate("YYMMDDhhmmss",timestamp())
}

variable "VCenter" {
    type = string
    description = "The IP address or the FQDN of the vCenter server"
}
variable "VCCluster" {
    type = string
    description = "The cluster name the VM should be deployed to within vCenter"
}
variable "VCUser" {
    type = string
    description = "The user name used to connect to vCenter, minimum permissions are: TODO"
}
variable "VCPassword" {
    type = string
    sensitive = true
    description = "The password for the user name used to connect to vCenter"
}
variable "VCDataStore" {
    type = string
    description = "The Datastore where the VM should be put"
    default = "NFS01"
}
variable "VCNetwork" {
    type = string
    description = "The network that the VM should use"
}
variable "VCFolder" {
    type = string
    description = "The folder wher ethe VM should be placed"
    default = "templates"
}
variable "WinRMUser" {
    type = string
    description = "The username of the account that should be used to connect to the windows instance via SSH"
}
variable "WinRMPassword" {
    type = string
    sensitive = true
    description = "The password for the username of the account that should be used to connect to the windows instance via SSH"
}
variable "Zone" {
    type = string
    description = "The zone the template should be assigned to, this will generate a VMware key value pair in as a tag entry"
}
variable "Environment" {
    type = string
    description = "The environment the template should be assigned to, this will generate a VMware key value pair in as a tag entry"
}