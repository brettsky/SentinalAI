locals {
  environments = {
    "dev" = { log-level = "debug" }
    "staging" = { log-level = "farting" }
    "prod" = { log-level = "warning" }
  }
}