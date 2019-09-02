locals {
  common_tags = {
    environment = var.environment_name
    owner       = var.owner_name
    ttl         = var.ttl
  }
  all_tags                = merge(local.common_tags, var.tags == null ? {} : var.tags)
  database_admin_password = var.database_admin_password == null ? random_password.password.result : var.database_admin_password

}

resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

resource "random_password" "password" {
  length      = 16
  upper       = true
  lower       = true
  number      = true
  special     = true
  min_upper   = 2
  min_lower   = 2
  min_numeric = 2
  min_special = 2
}

resource "google_sql_database_instance" "main" {
  name             = "${var.environment_name}-${var.name}-${random_string.random.result}"
  database_version = var.database_version
  region           = var.region
  project          = var.project

  settings {
    tier = var.database_tier
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "Any"
        value = "0.0.0.0/0"
      }
    }
    user_labels = local.all_tags
  }
}

resource "google_sql_user" "main" {
  instance = google_sql_database_instance.main.name
  name     = var.database_admin_username
  password = local.database_admin_password
  host     = var.database_admin_host
}

resource "google_sql_database" "main" {
  for_each = toset(var.database_names)
  name     = each.key
  instance = google_sql_database_instance.main.name
  project  = var.project
}
