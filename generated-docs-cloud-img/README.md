<!-- BEGIN_TF_DOCS -->
## Usage

This is an example for using the `proxmox/cloud-img-download` module and the required variables. Get the release ID from the [releases page](https://github.com/shakir85/proxmox-tf-modules/releases).

```hcl
module "<NAME>" {
 source              = "git::https://github.com/shakir85/terraform_modules.git//proxmox/cloud-img-download?ref=<RELEADE_ID>"
 proxmox_node_name   = ""
 cloud_image_url     = ""
storage_pool         = ""
}
```

## Image Names Explaination

The `locals` block in the module is a work around a Proxmox limitation related to saving
cloud images with `.qcow2` extension. This `locals` block extracts
the file name from the provided URL, and the subsequent resource appends
`.img` to it.

As a result, the final image file will always have the `.img` extension.
For example, a `.qcow2` file will be stored as `foo.qcow2.img`, while an
existing `.img` file will be renamed to `foo.img.img`.

For more details, refer to the [provider's documentation](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_download_file#file_name).

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.5.7)

- <a name="requirement_local"></a> [local](#requirement\_local) (>= 2.5.1)

- <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) (0.70.0)

## Providers

The following providers are used by this module:

- <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) (0.70.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [proxmox_virtual_environment_download_file.cloud_image_file](https://registry.terraform.io/providers/bpg/proxmox/0.70.0/docs/resources/virtual_environment_download_file) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_cloud_image_url"></a> [cloud\_image\_url](#input\_cloud\_image\_url)

Description: URL for downloading the cloud image.

Type: `string`

### <a name="input_proxmox_node_name"></a> [proxmox\_node\_name](#input\_proxmox\_node\_name)

Description: Proxmox node name. In a single-node environment, it's typically: `pve`.

Type: `string`

### <a name="input_storage_pool"></a> [storage\_pool](#input\_storage\_pool)

Description: Proxmox storage pool (i.e. disk name) where the cloud image will be downloaded.

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
