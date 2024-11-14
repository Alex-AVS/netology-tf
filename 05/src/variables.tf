###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###common vars

variable "vms_ssh_user" {
  type        = string
  default     = "ubuntu"
  description = "Username for SSH access to VMs."
}

variable "vms_common_options" {
  type = object({
    preemptible = bool
    public_ip = bool
    platform = string
    meta_serial-port-enable = number
    env_name       = string
    subnet_zones   = list(string)
    boot_disk_size = number
    instance_name  = string
    instance_count = number
    instance_core_fraction = number
    instance_memory = number
    image_family   = string
  })
  default = {
      preemptible = true
      platform       = "standard-v1"
      env_name       = "develop"
      subnet_zones   = ["ru-central1-a"]
      instance_name  = "webs"
      instance_count = 1
      boot_disk_size = 5
      instance_core_fraction = 5
      instance_memory = 1
      image_family   = "ubuntu-2004-lts"
      public_ip      = true
      meta_serial-port-enable = 1
  }
  description = "Parameters common to all VMs"
}

variable "projects" {
  type = list(string)
  default = ["marketing", "analytics"]
  description = "Project names to create VMs for."
}

