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

### vms variables
variable "vms_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image family"
}

variable "vms_ssh_user" {
  type        = string
  default     = "ubuntu"
  description = "Username for SSH access to VMs."
}

variable "vms_common_options" {
  type = object({
    preemptive = bool
    net_nat = bool
    platform = string
    meta_serial-port-enable = number
  })
  default = {
      preemptive = true
      net_nat = true
      platform = "standard-v1"
      meta_serial-port-enable = 1
    }
  description = "Parameters common to all VMs"
}

variable "vms_web_name_prefix" {
  type        = string
  default     = "web"
  description = "Web VM name prefix"
}

variable "vms_web_vm_count" {
  type        = number
  default     = 2
  description = "Number of Web VMs to create"
}

variable "vms_web_options" {
  type = object({
    cores = number
    cores_fraction = number
    memory = number
  })
  default = {
      cores = 2
      cores_fraction = 5
      memory = 1
    }
  description = "Web VMs resources and options"
}

### database VMs vars

variable "vms_db_options" {
  type = list(object({
    name = string
    cores = number
    cores_fraction = number
    memory = number
    hdd_size = number
  }))
  default = [{
      name = "main"
      cores = 4
      cores_fraction = 20
      memory = 4
      hdd_size = 5
    },
    {
      name = "replica"
      cores = 2
      cores_fraction = 5
      memory = 2
      hdd_size = 10
    }]
  description = "Database VMs resources and options"
}

### storage VM params

variable "vms_storage_disk_count" {
  type = number
  default = 3
  description = "Storage VM secondary disks count"
}

variable "vms_storage_disk_options" {
  type = object({
    basename = string
    size = number
})
  default = {
    basename = "data"
    size = 1
  }
  description = "Storage VM secondary disks parameters"
}

variable "vms_storage_vm_options" {
  type = object({
    name = string
    cores = number
    cores_fraction = number
    memory = number
  })
  default = {
      name = "storage"
      cores = 2
      cores_fraction = 20
      memory = 2
    }
  description = "Storage VM resources and options"
}

variable "ansible_hosts_template" {
  type        = string
  default     = "hosts.tftpl"
  description = "hosts file template"
}

variable "ansible_hosts_output" {
  type        = string
  default     = "hosts.ini"
  description = "Ansible hosts file name"
}
