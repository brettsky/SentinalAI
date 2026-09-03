variable "environments" {
  type = map(object({
    environment = string
    log_level   = string
  }))

  validation {
    condition = alltrue([

      for k, v in var.environments : contains((["dev", "prod", "staging"]), v.environment) &&
      contains((["high", "super", "CRITICAL"]), v.log_level)
    ])
    error_message = "Environment must be set to DEV, Staging or Prod, And Log level must be High, Super or Crititcal"
  }
}

