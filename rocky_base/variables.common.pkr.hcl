variable "preseed_path" {
  type    = string
  default = "ks.cfg"
}

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
  http_directory = dirname(convert(fileset(".", "etc/http/*"), list(string))[0])
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
variable "SSHUser" {
    type = string
    description = "The username of the account that should be used to connect to the windows instance via SSH"
}
variable "SSHPassword" {
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