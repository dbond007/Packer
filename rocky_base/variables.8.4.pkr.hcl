variable "rocky_84_version" {
  default = "8.4"
}

locals {
  iso_url_rocky_84           = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-8.4-x86_64-dvd1.iso"
  iso_checksum_url_rocky_84  = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/CHECKSUM"
  rocky_84_boot_command      = [
    "<up><wait><tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.preseed_path}<enter><wait>"
  ]

}