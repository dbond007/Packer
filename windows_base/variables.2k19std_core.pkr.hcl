variable "windows_2k19_core_version" {
  default = "10.0.17763"
}

locals {
  win2k19std_core_unattend        = "etc/unattend/2019/standard_core/autounattend.xml"
}