 
variable "ubuntu_1804_version" {
  default = "18.04.5"
}

locals {
  iso_url_ubuntu_1804           = "http://no.releases.ubuntu.com/18.04.5/ubuntu-18.04.5-live-server-amd64.iso"
  iso_checksum_url_ubuntu_1804  = "http://no.releases.ubuntu.com/18.04.5/SHA256SUMS"
  ubuntu_1804_boot_command      = [
 #   "<enter><enter><f6><esc><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
  #  " auto<wait>",
   # " console-setup/ask_detect=false<wait>",
  #  " console-setup/layoutcode=us<wait>",
  #  " console-setup/modelcode=pc105<wait>",
  #  " debconf/frontend=noninteractive<wait>",
  #  " debian-installer=en_US<wait>",
  #  " fb=false<wait>",
  #  " kbd-chooser/method=us<wait>",
  #  " keyboard-configuration/layout=USA<wait>",
  #  " keyboard-configuration/variant=USA<wait>",
  #  " locale=en_US<wait>",
  #  " netcfg/get_domain=vm<wait>",
  #  " netcfg/get_hostname=vagrant<wait>",
  #  " grub-installer/bootdev=/dev/sda<wait>",
  #  " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.preseed_path}<wait>",
  #  " -- <wait>",
  #  "<enter><wait>"
    "<enter><enter><f6><esc><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter><wait>"
  ]
}