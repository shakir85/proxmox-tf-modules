variable "disk_name" {
  type        = string
  description = "Proxmox storage pool (disk name) where the VM's disk should be stored. The disk must support the Snippet storage type as it will be used for other resources."
}

variable "proxmox_node_name" {
  type        = string
  description = "Proxmox node name. In a single-node environment, it's typically: `pve`"
}

variable "hostname" {
  type        = string
  description = "VM hostname."

  validation {
    condition     = can(regex("^([a-zA-Z0-9-]{1,63})$|^([a-zA-Z0-9-]{1,63}\\.[a-zA-Z0-9-]{1,63})*$", var.hostname))
    error_message = "hostname must be a valid DNS name"
  }
}

variable "username" {
  type        = string
  description = "Default user. This will be a sudo user and have SSH login access."
}

variable "temp_user_password" {
  default     = "changeme"
  type        = string
  description = "Temorary login password. Upon the first login, a prompt to change the password will be presented."
}

variable "timezone" {
  type        = string
  description = "Timezone to be configured via `timedatectl` in cloud-init template."
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to the local public key to be added to the default user's `.ssh/authorized_keys` file."
}
