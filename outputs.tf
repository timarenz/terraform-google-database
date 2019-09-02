output "self_link" {
  value = google_sql_database_instance.main.self_link
}

output "connection_name" {
  value = google_sql_database_instance.main.connection_name
}

output "public_ip" {
  value = google_sql_database_instance.main.public_ip_address
}

output "private_ip" {
  value = google_sql_database_instance.main.private_ip_address
}

output "database_names" {
  # value = google_sql_database.main[*].name
  value = var.database_names
}

output "database_admin_username" {
  value = var.database_admin_username
}

output "database_admin_password" {
  value     = local.database_admin_password
  sensitive = true
}
