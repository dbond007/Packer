source "vsphere-iso" "base-ubuntu-amd64" {
        create_snapshot = true
        vcenter_server = var.VCenter 
        insecure_connection = true
        username =  var.VCUser 
        password =  var.VCPassword 
        cluster =  var.VCCluster 
        folder =  var.VCFolder 
        ssh_username = var.SSHUser
        ssh_password = var.SSHPassword
        ssh_handshake_attempts = 1000
        ssh_timeout = "10000s"
        remove_cdrom = true
        NestedHV = false
        convert_to_template = true
        CPUs = 2
        RAM = 4096
        #firmware = "efi-secure"
        network_adapters  {
            network = var.VCNetwork
            network_card = "vmxnet3"
        }
        datastore =  var.VCDataStore 
        disk_controller_type =  ["pvscsi"]
        guest_os_type = "ubuntu64Guest"
        storage {
            disk_thin_provisioned = true
            disk_size = 32768
        }
	    #iso_paths = [
        #    var.SourceISO
        #]
        boot_wait = "6s"
    
        shutdown_command = "echo 'packer'|sudo -S shutdown -P now"
       configuration_parameters = {
           "disk.EnableUUID" = "TRUE"
       }
    }