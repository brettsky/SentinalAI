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
  for_each = var.environment
  filename = "${path.module}/Sentinel-${var.environment[each.key]}/logs/logs.txt"
  content  = "environment=${each.key} log_level=${var.log-level[each.key]}"
}

resource "local_file" "Sentinel-app-conf" {
  for_each = var.environment
  filename = "${path.module}/Sentinel-${var.environment[each.key]}/config/application.conf"
  content  = "environment=${each.key} log_level=${var.log-level[each.key]}"

}

resource "local_file" "Sentinel-env-conf" {
  for_each = var.environment
  filename = "${path.module}/Sentinel-${var.environment[each.key]}/config/environment.conf"
  content  = "environment=${each.key} log_level=${var.log-level[each.key]}"
}


resource "local_file" "Sentinel-data" {
  for_each = var.environment
  filename = "${path.module}/Sentinel-${var.environment[each.key]}/data/data.txt"
  content  = "environment=${each.key} log_level=${var.log-level[each.key]}"
}


