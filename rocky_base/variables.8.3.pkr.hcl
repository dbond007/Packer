variable "rocky_83_version" {
  default = "8.3"
}

locals {
  iso_url_rocky_83           = "https://download.rockylinux.org/pub/rocky/8.3/isos/x86_64/Rocky-8.3-x86_64-dvd1.iso"
  iso_checksum_url_rocky_83  = "https://download.rockylinux.org/pub/rocky/8.3/isos/x86_64/CHECKSUM"
  rocky_83_boot_command      = [
    "<up><wait><tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.preseed_path}<enter><wait>"
  ]

}