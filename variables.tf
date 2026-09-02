variable "environment" {
  type        = map(string)
  description = "Deployment environment name"
  default = {
    dev     = "dev"
    staging = "staging"
    prod    = "prod"
  }
}


variable "log-level" {
  type        = map(string)
  description = "logging level"
  default = {
    dev     = "high"
    staging = "super"
    prod    = "super super high"
  }
}