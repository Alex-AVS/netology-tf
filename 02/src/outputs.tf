output "vm_info" {
  value = [
    [
      {
        vm_name = yandex_compute_instance.platform.name,
        vm_external_ip = yandex_compute_instance.platform.network_interface[0].nat_ip_address,
        vm_fqdn = yandex_compute_instance.platform.fqdn
      }
    ],
    [
      {
        vm_name = yandex_compute_instance.platform_db.name,
        vm_external_ip = yandex_compute_instance.platform_db.network_interface[0].nat_ip_address,
        vm_fqdn = yandex_compute_instance.platform_db.fqdn
      }
    ]
  ]
}