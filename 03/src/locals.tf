locals {
  vms_ssh-keys = "${var.vms_ssh_user}:${file("~/.ssh/id_ed25519.pub")}"
  }