/**
 * ## Usage
 *
 * This is an example for using the `proxmox/lxc` module and the required variables. Get the release ID from the [releases page](https://github.com/shakir85/proxmox-tf-modules/releases).
 *
 * ```hcl
 * module "<NAME>" {
 * Required Variables
 * source              = "git::https://github.com/shakir85/terraform_modules.git//proxmox/lxc?ref=<RELEADE_ID>"
 * node_name             = ""
 * disk_id               = ""
 * ssh_public_key_path   = ""
 * username              = ""
 * hostname              = ""
 * template_file_id      = ""
 * #
 * # Optional Variables (default values presented below)
 * #
 * description           = "Manage by Terraform"
 * ip_config             = "dhcp"
 * network_interface     = "eth0"
 * os_type               = "unmanaged"
 * disk_size             = "4"
 * memory                = 1024
 * cpu_cores             = 1
 * unprivileged          = true
 * firewall              = true
 * }
 * ```
 */

terraform {
  required_version = ">= 1.5.7"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.76.1"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.5.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

data "local_file" "ssh_public_key" {
  filename = var.ssh_public_key_path
}

resource "proxmox_virtual_environment_container" "lxc_container" {
  description = var.description

  node_name = var.node_name
  # vm_id     = 1234

  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = var.ip_config
      }
    }

    user_account {
      keys = [
        trimspace(data.local_file.ssh_public_key.content)
      ]
      # Password is set randomly. Use ssh for login and change the password
      password = random_password.lxc_container_password.result

    }
  }

  network_interface {
    name     = var.network_interface
    firewall = var.firewall
  }

  operating_system {
    # template_file_id = proxmox_virtual_environment_download_file.latest_ubuntu_22_jammy_lxc_img.id
    template_file_id = var.template_file_id
    # Or you can use a volume ID, as obtained from a "pvesm list <storage>"
    # template_file_id = "local:vztmpl/jammy-server-cloudimg-amd64.tar.gz"
    type = var.os_type
  }

  cpu {
    cores = var.cpu_cores
  }

  memory {
    swap      = 0
    dedicated = var.memory
  }

  disk {
    datastore_id = var.disk_id
    size         = var.disk_size
  }

  unprivileged = var.unprivileged
}

resource "random_password" "lxc_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}
