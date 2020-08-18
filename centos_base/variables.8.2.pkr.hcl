variable "centos_82_version" {
  default = "8.2.2004"
}

locals {
  iso_url_centos_82           = "https://mirrors.edge.kernel.org/centos/8.2.2004/isos/x86_64/CentOS-8.2.2004-x86_64-dvd1.iso"
  iso_checksum_url_centos_82  = "https://mirrors.edge.kernel.org/centos/8.2.2004/isos/x86_64/CHECKSUM"
  centos_82_boot_command      = [
    "<up><wait><tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.preseed_path}<enter><wait>"
  ]

}