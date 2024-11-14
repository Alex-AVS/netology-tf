variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Availability zone name"
}
variable "cidr" {
  type        = list(string)
  description = "Subnet cidr addresses"
}

variable "vpc_name" {
  type        = string
  description = "VPC network&subnet name"
}