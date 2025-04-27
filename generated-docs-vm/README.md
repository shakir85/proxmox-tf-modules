<!-- BEGIN_TF_DOCS -->
## Usage

This is an example for using the `proxmox/vm` module and the required variables. Get the release ID from the [releases page](https://github.com/shakir85/proxmox-tf-modules/releases).

```hcl
module "<NAME>" {
  # Required Variables
  source              = "git::https://github.com/shakir85/terraform_modules.git//proxmox/vm?ref=<RELEADE_ID>"
  proxmox_node_name   = ""
  disk_name           = ""
  ssh_public_key_path = ""
  username            = ""
  hostname            = ""
  timezone            = ""
  cloud_image_info    = ["STORAGE_POOL", "CLOUD_IMAGE_FILE_NAME"]
  disk_size           = ""

  # Optional Variables (default values presented below)
  description        = "Managed by Terraform"
  tags               = ["terraform"]
  cores              = 1
  sockets            = 1
  memory             = 512
  temp_user_password = "changeme" # You'll be asked to change this password upon your first login
  See provider's docs: bpg/proxmox before change the below optional vars
  disk_interface    = "scsi0"
  network_interface = "vmbr0"
  cpu_type          = "qemu64"
}

# Print any output block from the main module
output "module_outputs" {
  value = module.<NAME>
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

- [proxmox_virtual_environment_file.cloud_config](https://registry.terraform.io/providers/bpg/proxmox/0.70.0/docs/resources/virtual_environment_file) (resource)
- [proxmox_virtual_environment_vm.vm_resource](https://registry.terraform.io/providers/bpg/proxmox/0.70.0/docs/resources/virtual_environment_vm) (resource)
- [random_string.random_cloud_init_id](https://registry.terraform.io/providers/hashicorp/random/3.6.3/docs/resources/string) (resource)
- [local_file.ssh_public_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_cloud_image_info"></a> [cloud\_image\_info](#input\_cloud\_image\_info)

Description:   A list of strings as the following:  
  index 0 for storage pool (disk) name where the cloud image iso, img, qcow... etc is stored.  
  index 1 for cloud-image file name (it must end with `.img` extension)  
  For example: `cloud_image_info: ["local-lvm", "debian-12-generic.qcow2.img"]`.

Type: `list(string)`

### <a name="input_disk_name"></a> [disk\_name](#input\_disk\_name)

Description: Proxmox storage pool (disk name) where the VM's disk should be stored. The disk must support the Snippet storage type as it will be used for other resources.

Type: `string`

### <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size)

Description: Disk size in Gigabytes

Type: `string`

### <a name="input_hostname"></a> [hostname](#input\_hostname)

Description: VM hostname.

Type: `string`

### <a name="input_proxmox_node_name"></a> [proxmox\_node\_name](#input\_proxmox\_node\_name)

Description: Proxmox node name. In a single-node environment, it's typically: `pve`

Type: `string`

### <a name="input_ssh_public_key_path"></a> [ssh\_public\_key\_path](#input\_ssh\_public\_key\_path)

Description: Path to the local public key to be added to the default user's `.ssh/authorized_keys` file.

Type: `string`

### <a name="input_timezone"></a> [timezone](#input\_timezone)

Description: Timezone to be configured via `timedatectl` in cloud-init template.

Type: `string`

### <a name="input_username"></a> [username](#input\_username)

Description: Default user. This will be a sudo user and have SSH login access.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_cores"></a> [cores](#input\_cores)

Description: The number of CPU cores.

Type: `number`

Default: `1`

### <a name="input_cpu_type"></a> [cpu\_type](#input\_cpu\_type)

Description: The emulated CPU type. Some VMs need certain types of CPUs. See available values in [the provider docs](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_vm#host).

Type: `string`

Default: `"qemu64"`

### <a name="input_description"></a> [description](#input\_description)

Description: VM resource description.

Type: `string`

Default: `"Managed by Terraform"`

### <a name="input_disk_interface"></a> [disk\_interface](#input\_disk\_interface)

Description: Storage disk interface. Default value: `scsi0`.

Type: `string`

Default: `"scsi0"`

### <a name="input_enable_guest_agent"></a> [enable\_guest\_agent](#input\_enable\_guest\_agent)

Description: Whether to enable the QEMU guest agent. The `qemu-guest-agent` must be installed **and** running. Read the 'Qemu guest agent' section [in bpg/proxmox docs](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_vm#qemu-guest-agent) first.

Type: `bool`

Default: `false`

### <a name="input_firewall_is_enabled"></a> [firewall\_is\_enabled](#input\_firewall\_is\_enabled)

Description: Whether this interface's firewall rules should be used

Type: `bool`

Default: `false`

### <a name="input_memory"></a> [memory](#input\_memory)

Description: The dedicated memory in megabytes

Type: `number`

Default: `512`

### <a name="input_network_interface"></a> [network\_interface](#input\_network\_interface)

Description: Default node's network device bridge. Default value: `vmbr0`.

Type: `string`

Default: `"vmbr0"`

### <a name="input_sockets"></a> [sockets](#input\_sockets)

Description: The number of CPU sockets.

Type: `number`

Default: `1`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: List of strings for tags. For example: ['terraform', 'ubuntu'].

Type: `list(string)`

Default:

```json
[
  "terraform"
]
```

### <a name="input_temp_user_password"></a> [temp\_user\_password](#input\_temp\_user\_password)

Description: Temorary login password. Upon the first login, a prompt to change the password will be presented.

Type: `string`

Default: `"changeme"`

## Outputs

The following outputs are exported:

### <a name="output_print_temp_password"></a> [print\_temp\_password](#output\_print\_temp\_password)

Description: Prints the temporary login password defined by `var.temp_user_password`. Check the variable's default value above. You'll be required to change it on your first login.
<!-- END_TF_DOCS -->
