/*resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}*/

module "vpc-net" {
  source = "./modules/vpc_dev"
  zone = var.default_zone
  cidr = var.default_cidr
  vpc_name = var.vpc_name
}

module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=4d05fab828b1fcae16556a4d167134efca2fccf2"
  for_each = toset(var.projects)

  env_name       = var.vms_common_options.env_name
  network_id     = module.vpc-net.vpc_subnet.network_id
  subnet_zones   = var.vms_common_options.subnet_zones
  #subnet_ids     = [yandex_vpc_subnet.develop.id]
  subnet_ids     = [module.vpc-net.vpc_subnet.id]
  instance_name  = "${var.vms_common_options.instance_name}-${each.key}"
  instance_count = var.vms_common_options.instance_count
  image_family   = var.vms_common_options.image_family
  public_ip      = var.vms_common_options.public_ip
  #добавим, чтобы не тратить денег
  platform = var.vms_common_options.platform
  instance_core_fraction = var.vms_common_options.instance_core_fraction
  preemptible = var.vms_common_options.preemptible
  boot_disk_size = var.vms_common_options.boot_disk_size
  instance_memory = var.vms_common_options.instance_memory

  labels = {
    project = each.value
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.vms_common_options.meta_serial-port-enable
  }

}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username        = var.vms_ssh_user
    ssh_public_key  = local.vms_ssh_root_key
  }
}
