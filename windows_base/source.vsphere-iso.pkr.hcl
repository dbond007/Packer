source "vsphere-iso" "base-windows-amd64" {
        create_snapshot = true
        vcenter_server = var.VCenter 
        insecure_connection = true
        username =  var.VCUser 
        password =  var.VCPassword 
        cluster =  var.VCCluster 
        folder =  var.VCFolder 
        communicator = "winrm"
        winrm_username =  var.WinRMUser 
        winrm_password =  var.WinRMPassword 
        winrm_timeout = "60m"
        remove_cdrom = true
        NestedHV = false
        convert_to_template = true
        CPUs = 2
        RAM = 4096
        firmware = "efi-secure"
        network_adapters  {
            network = var.VCNetwork
            network_card = "vmxnet3"
        }
        datastore =  var.VCDataStore 
        disk_controller_type =  ["pvscsi"]
        guest_os_type = "windows9Server64Guest"
        storage {
            disk_thin_provisioned = true
            disk_size = 32768
        }
        boot_wait = "3s"
       configuration_parameters = {
           "disk.EnableUUID" = "TRUE"
       }
    }