resource "yandex_compute_disk" "store-data" {
  count = var.vms_storage_disk_count
  name = "${var.vms_storage_disk_options.basename}-${count.index + 1}"
  size = var.vms_storage_disk_options.size
}

resource "yandex_compute_instance" "storage" {

  name        = var.vms_storage_vm_options.name
  platform_id = var.vms_common_options.platform

  resources {
    cores         = var.vms_storage_vm_options.cores
    memory        = var.vms_storage_vm_options.memory
    core_fraction = var.vms_storage_vm_options.cores_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.store-data
    content {
      disk_id = lookup(secondary_disk.value, "id")
    }
  }

  scheduling_policy {
    preemptible = var.vms_common_options.preemptive
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vms_common_options.net_nat
  }

  metadata = {
    serial-port-enable = var.vms_common_options.meta_serial-port-enable
    ssh-keys           = local.vms_ssh-keys
  }
}