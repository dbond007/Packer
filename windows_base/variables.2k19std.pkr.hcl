variable "windows_2k19_version" {
  default = "10.0.17763"
}

locals {
  win2k19std_unattend        = "etc/unattend/2019/standard/autounattend.xml"
}