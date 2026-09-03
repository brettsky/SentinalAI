output "number_of_environments" {
  value = length(var.environments)
}

output "environments" {
  value = var.environments
}