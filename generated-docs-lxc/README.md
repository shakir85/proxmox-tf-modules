<!-- BEGIN_TF_DOCS -->
## Usage

This is an example for using the `proxmox/lxc` module and the required variables. Get the release ID from the [releases page](https://github.com/shakir85/proxmox-tf-modules/releases).

```hcl
module "<NAME>" {
Required Variables
source              = "git::https://github.com/shakir85/terraform_modules.git//proxmox/lxc?ref=<RELEADE_ID>"
node_name             = ""
disk_id               = ""
ssh_public_key_path   = ""
username              = ""
hostname              = ""
template_file_id      = ""
#
# Optional Variables (default values presented below)
#
description           = "Manage by Terraform"
ip_config             = "dhcp"
network_interface     = "eth0"
os_type               = "unmanaged"
disk_size             = "4"
memory                = 1024
cpu_cores             = 1
unprivileged          = true
firewall              = true
}
```

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.5.7)

- <a name="requirement_local"></a> [local](#requirement\_local) (>= 2.5.1)

- <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) (0.70.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (3.6.3)

## Providers

The following providers are used by this module:

- <a name="provider_local"></a> [local](#provider\_local) (>= 2.5.1)

- <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) (0.70.0)

- <a name="provider_random"></a> [random](#provider\_random) (3.6.3)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [proxmox_virtual_environment_container.lxc_container](https://registry.terraform.io/providers/bpg/proxmox/0.70.0/docs/resources/virtual_environment_container) (resource)
- [random_password.lxc_container_password](https://registry.terraform.io/providers/hashicorp/random/3.6.3/docs/resources/password) (resource)
- [local_file.ssh_public_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_disk_id"></a> [disk\_id](#input\_disk\_id)

Description: Storage disk identifier (name)

Type: `string`

### <a name="input_hostname"></a> [hostname](#input\_hostname)

Description: Hostname to assign to the container

Type: `string`

### <a name="input_node_name"></a> [node\_name](#input\_node\_name)

Description: The name of the node to assign the container to

Type: `string`

### <a name="input_ssh_public_key_path"></a> [ssh\_public\_key\_path](#input\_ssh\_public\_key\_path)

Description: Path to the local public key to be added to the default user's `.ssh/authorized_keys` file.

Type: `string`

### <a name="input_template_file_id"></a> [template\_file\_id](#input\_template\_file\_id)

Description: The identifier for an OS template file. The ID format is <datastore\_id>:<content\_type>/<file\_name>, for example local:iso/jammy-server-cloudimg-amd64.tar.gz.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_cpu_cores"></a> [cpu\_cores](#input\_cpu\_cores)

Description: The number of CPU cores

Type: `number`

Default: `1`

### <a name="input_description"></a> [description](#input\_description)

Description: Container description

Type: `string`

Default: `"Manage by Terraform"`

### <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size)

Description: The size of the root filesystem in gigabytes (defaults to 4). When set to 0 a directory or zfs/btrfs subvolume will be created. Requires datastore\_id to be set.

Type: `string`

Default: `"4"`

### <a name="input_firewall"></a> [firewall](#input\_firewall)

Description: Whether this interface's firewall rules should be used

Type: `bool`

Default: `true`

### <a name="input_ip_config"></a> [ip\_config](#input\_ip\_config)

Description: The IP configuration (default to dhcp)

Type: `string`

Default: `"dhcp"`

### <a name="input_memory"></a> [memory](#input\_memory)

Description: The dedicated memory in megabytes

Type: `number`

Default: `1024`

### <a name="input_network_interface"></a> [network\_interface](#input\_network\_interface)

Description: A network interface

Type: `string`

Default: `"eth0"`

### <a name="input_os_type"></a> [os\_type](#input\_os\_type)

Description: OS type: Alpine, Ubunt ...etc

Type: `string`

Default: `"unmanaged"`

### <a name="input_unprivileged"></a> [unprivileged](#input\_unprivileged)

Description: Whether the container runs as unprivileged on the host

Type: `bool`

Default: `true`

## Outputs

No outputs.
<!-- END_TF_DOCS -->
