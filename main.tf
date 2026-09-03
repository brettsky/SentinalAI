# Configuration using provider functions must include required_providers configuration.
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      # Setting the provider version is a strongly recommended practice
      version = "2.9.0"
    }
  }
  # Provider functions require Terraform 1.8 and later.
  required_version = ">= 1.8.0"
}





resource "local_file" "Sentinel-logs" {
  for_each = var.environments
  filename = "${path.module}/Sentinel-${each.value.environment}/logs/logs.txt"
  content  = "environment=${each.key} log_level=${each.value.log_level}"
}

resource "local_file" "Sentinel-app-conf" {
  for_each = var.environments
  filename = "${path.module}/Sentinel-${each.value.environment}/config/application.conf"
  content  = "environment=${each.key} log_level=${each.value.log_level}"

}

resource "local_file" "Sentinel-env-conf" {
  for_each = var.environments
  filename = "${path.module}/Sentinel-${each.value.environment}/config/environment.conf"
  content  = "environment=${each.key} log_level=${each.value.log_level}"
}


resource "local_file" "Sentinel-data" {
  for_each = var.environments
  filename = "${path.module}/Sentinel-${each.value.environment}/data/data.txt"
  content  = "environment=${each.key} log_level=${each.value.log_level}"
}


