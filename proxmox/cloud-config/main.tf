data "local_file" "ssh_public_key" {
  filename = var.ssh_public_key_path
}

resource "random_string" "cloud_init_id" {
  length  = 4
  special = false
  upper   = false
}

resource "proxmox_virtual_environment_file" "cloud_config" {
  content_type = "snippets"
  datastore_id = var.disk_name
  node_name    = var.proxmox_node_name

  source_raw {
    data = <<EOF
    #cloud-config
    hostname: ${var.hostname}
    write_files:
      - path: /etc/hosts
        content: |
          127.0.0.1 ${var.hostname}
    users:
      - default
      - name: ${var.username}
        groups:
          - sudo
        shell: /bin/bash
        ssh_authorized_keys:
          - ${trimspace(data.local_file.ssh_public_key.content)}
        sudo: ALL=(ALL) NOPASSWD:ALL
    chpasswd:
      list: |
        ${var.username}:${var.temp_user_password}
    runcmd:
      - timedatectl set-timezone ${var.timezone}
      - echo "done" > /tmp/cloud-config.done
    EOF

    file_name = "cloud-init-config-${var.hostname}-${random_string.random_cloud_init_id.result}.yaml"
  }
}

output "print_temp_password" {
  description = "Shows the temporary login password defined by `var.temp_user_password`."
  value       = "Your login password is: ${var.temp_user_password}\nYou will be required to change the password on your first login."
}

