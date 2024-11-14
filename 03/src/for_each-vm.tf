resource "yandex_compute_instance" "db" {
  for_each = {
    for index, vm in var.vms_db_options:
    vm.name => vm
  }
  name        = each.value.name
  platform_id = var.vms_common_options.platform

  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.cores_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.hdd_size
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