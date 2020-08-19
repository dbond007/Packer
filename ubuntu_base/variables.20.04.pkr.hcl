variable "ubuntu_2004_version" {
  default = "20.04.1"
}

locals {
  iso_url_ubuntu_2004           = "http://no.releases.ubuntu.com/20.04.1/ubuntu-20.04.1-live-server-amd64.iso"
  iso_checksum_url_ubuntu_2004  = "http://no.releases.ubuntu.com/20.04.1/SHA256SUMS"
  ubuntu_2004_boot_command      = [
    "<enter><enter><f6><esc><wait> ",
    "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter><wait>"
  ]
}