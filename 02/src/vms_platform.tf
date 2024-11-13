### vms variables
variable "vms_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image family"
}

variable "vms_name_prefix" {
  type        = string
  default     = "netology-develop-platform"
  description = "VM name prefix"
}

variable "vms_resources" {
  type = map(object({
    cores = number
    cores_fraction = number
    memory = number
  }))
  default = {
    "web" = {
      cores = 2
      cores_fraction = 5
      memory = 1
    },
    "db" = {
      cores = 2
      cores_fraction = 20
      memory = 2
    }
  }
}

variable "vms_metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys = string
  }))
  default = {
    "value" = {
      serial-port-enable = 1
      ssh-keys           = "ubuntu:ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBN7IauozMX1+kZMrnzIxvsxSVaI+DSxzjFIaa89RNMaRbnc/uZbeC+IHoK4PN8DgNZhA5z7Q4Ecil6z0GVTSW08="
    }
  }
}

### web vm variables

variable "vm_web_name_suffix" {
  type        = string
  default     = "web"
  description = "Web VM name suffix"
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v1"
  description = "Web VM platform type"
}

/*
variable "vm_web_res_cpu" {
  type        = number
  default     = 2
  description = "Web VM CPU cores"
}

variable "vm_web_res_core_fraction" {
  type        = number
  default     = 5
  description = "Web VM cpu fraction"
}

variable "vm_web_res_memory" {
  type        = number
  default     = 1
  description = "Web VM memory size"
}
*/

variable "vm_web_preemptive" {
  type        = bool
  default     = true
  description = "Web VM preemptive"
}

variable "vm_web_net_nat" {
  type        = bool
  default     = true
  description = "Web VM NAT enable"
}

/*
variable "vm_web_meta_serial" {
  type        = number
  default     = 1
  description = "Web VM console enable"
}

variable "vm_web_meta_ssh_user" {
  type        = string
  default     = "ubuntu"
  description = "Web VM SSH username"
}
*/

### db vm variables

variable "vm_db_name_suffix" {
  type        = string
  default     = "db"
  description = "DB VM name suffix"
}

variable "vm_db_platform" {
  type        = string
  default     = "standard-v1"
  description = "DB VM platform type"
}

/*
variable "vm_db_res_cpu" {
  type        = number
  default     = 2
  description = "DB VM CPU cores"
}

variable "vm_db_res_core_fraction" {
  type        = number
  default     = 20
  description = "DB VM cpu fraction"
}

variable "vm_db_res_memory" {
  type        = number
  default     = 2
  description = "DB VM memory size"
}
*/

variable "vm_db_preemptive" {
  type        = bool
  default     = true
  description = "DB VM preemptive"
}

variable "vm_db_net_nat" {
  type        = bool
  default     = true
  description = "DB VM NAT enable"
}

/*
variable "vm_db_meta_serial" {
  type        = number
  default     = 1
  description = "DB VM console enable"
}

variable "vm_db_meta_ssh_user" {
  type        = string
  default     = "ubuntu"
  description = "DB VM SSH username"
}
*/

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "DB VM availability zone"
}

variable "vm_db_net_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_net_name" {
  type        = string
  default     = "develop-db"
  description = "VPC network & subnet name"
}
