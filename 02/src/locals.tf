locals {
  vm_web_name = "${var.vms_name_prefix}-${var.vm_web_name_suffix}"
  vm_db_name = "${var.vms_name_prefix}-${var.vm_db_name_suffix}"
}