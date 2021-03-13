# Packer
Packer: https://www.packer.io/downloads templates for vmware

Fill in the required vars in the example pkrvar file and run

packer build -var-file="variables.pkrvars.hcl" .

in the directory of the OS you want.

# Description
This has been built using packer with VMware at the moment as the only destination package, but can be used to create additional 'templates', for example containers, ISOs, vagrant, KVM images etc.

The structure of the code is:
<pre>
{OS}
    - etc                           : where various additional scripts and data go 
        - scripts                   : scripts, put in her will be auto executed in aphabetical order
        - http                      : what ever you wish to be available to the OS via http from the system running packer
    build.{os}.pkr.hcl              : specifies all the details for the OS templates to built, uses source.{platform}.pkr.hcl
    source.{platform}.pkr.hcl       : details for the destination platform
    variables.{os-version}.pkr.hcl  : specifics for the OS version
    variables.common.pkr.hcl        : common variables and defaults that are required 
    variables.pkrvars.hcl.example   : example for the required variables that have no defaults
</pre>

## Ubuntu template 
This will build an 18.04, 20.04.2 and 20.10 and 21.04 daily template for ESXi

To build the 20.04+ and customise via ESXi, ESXi 6.7+ is required along with customisation via cloud init. The cloud-init config is sourced from http.

### Disk layout

The disk layout follows the CIS recommendations for separate partitions for different system folders to reduce the impact of a rouge process writing excessive data to the drive, for example logs.

The below table represents the layout within the preseed.cfg and cloud init config files.

Partition | FS type | Size
---------------|----------|-------
/boot|ext4|1GB
swap|swap|2GB
/|ext4|22GB
/tmp|ext4|2GB
/var|ext4|4GB
/var/tmp|ext4|2GB
/var/log|ext4|2GB
/var/log/audit|ext4|1GB
/home|ext4|4GB


### Certificate Trusts
The default trusts are left in place, but internal CAs have been added via the following entry in etc\http\user-data as a multiline list

<pre>
ca-certs:
        trusted: 
          - |
           -----BEGIN CERTIFICATE-----
           CERT GOES HERE
           -----END CERTIFICATE-----
          - |
           -----BEGIN CERTIFICATE-----
           CERT GOES HERE
           -----END CERTIFICATE-----
</pre>

### Repo
The repo location has currently not been defined but is available in etc\http\user-data under the following attributes

<pre>
# This will search in the static repos
apt:
  primary:
    - arches: [default]
      search:
        - http://local-mirror.mydomain
        - http://archive.ubuntu.com

# This will automatically search for a repo under http://<distro>-mirror.<domain>/<distro>
apt:
  primary:
    - arches: [default]
      search_dns: True
</pre>

