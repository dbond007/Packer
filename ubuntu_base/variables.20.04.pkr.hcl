variable "ubuntu_2004_version" {
  default = "20.04.2"
}

locals {
  iso_url_ubuntu_2004           = "http://no.releases.ubuntu.com/20.04.2/ubuntu-20.04.2-live-server-amd64.iso"
  iso_checksum_url_ubuntu_2004  = "http://no.releases.ubuntu.com/20.04.2/SHA256SUMS"
  iso_checksum_ubuntu_2004      = ""
  ubuntu_2004_boot_command      = [
    "<wait><enter><esc><wait5><f6><esc><wait>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "<bs><bs><bs>",
    "/casper/vmlinuz ",
    "initrd=/casper/initrd ",
    "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter><wait>"
  ]
}