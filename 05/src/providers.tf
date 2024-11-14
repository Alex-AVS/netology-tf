terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~>0.130.0"
    }
    template = {
      source = "hashicorp/template"
      version = "~>2.2.0"
    }
  }

  required_version = "~>1.8.4"

  backend "s3" {
    #profile = "default"
    region                      = "ru-central1"
    bucket                      = "p5yspy-tfstate-develop"
    key                         = "develop/terraform.tfstate"
    dynamodb_table              = "tfstate-develop"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true

    endpoints ={
      dynamodb = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gllpeampmbshu7kfno/etntrg3p8u1d3optqasl"
      s3 = "https://storage.yandexcloud.net"
    }
  }

}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}