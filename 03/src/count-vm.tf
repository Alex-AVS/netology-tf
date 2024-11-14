resource "yandex_compute_instance" "web" {

  depends_on = [yandex_compute_instance.db]
  count = var.vms_web_vm_count
  name        = "${var.vms_web_name_prefix}-${count.index + 1}"
  platform_id = var.vms_common_options.platform

  resources {
    cores         = var.vms_web_options.cores
    memory        = var.vms_web_options.memory
    core_fraction = var.vms_web_options.cores_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id

    }
  }
  scheduling_policy {
    preemptible = var.vms_common_options.preemptive
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vms_common_options.net_nat
    security_group_ids = ["${yandex_vpc_security_group.example.id}"]
  }

  metadata = {
    serial-port-enable = var.vms_common_options.meta_serial-port-enable
    ssh-keys           = local.vms_ssh-keys
  }
}