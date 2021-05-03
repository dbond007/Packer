variable "centos_83_version" {
  default = "8.3.2011"
}

locals {
  iso_url_centos_83           = "https://mirrors.edge.kernel.org/centos/8/isos/x86_64/CentOS-8.3.2011-x86_64-dvd1.iso"
  iso_checksum_url_centos_83  = "https://mirrors.edge.kernel.org/centos/8/isos/x86_64/CHECKSUM"
  centos_83_boot_command      = [
    "<up><wait><tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.preseed_path}<enter><wait>"
  ]

}