variable "rocky_85_version" {
  default = "8.5"
}

locals {
  iso_url_rocky_85           = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-8.5-x86_64-dvd1.iso"
  iso_checksum_url_rocky_85  = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/CHECKSUM"
  rocky_85_boot_command      = [
    "<up><wait><tab> inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.preseed_path}<enter><wait>"
  ]

}