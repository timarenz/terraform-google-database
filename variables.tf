variable "environment_name" {
  type = string
}

variable "owner_name" {
  type = string
}

variable "ttl" {
  type    = number
  default = 48
}

variable "project" {
  description = "Id of an existing project."
  type        = string
}

variable "region" {
  type    = string
  default = "europe-west4"
}

variable "name" {
  type = string
}

variable "database_version" {
  type    = string
  default = "MYSQL_5_7"
}

variable "database_tier" {
  type    = string
  default = "db-n1-standard-1"
}

variable "database_names" {
  type = list(string)
}

variable "database_admin_username" {
  type    = string
  default = "dbadmin"
}

variable "database_admin_password" {
  type    = string
  default = null
}

variable "database_admin_host" {
  type    = string
  default = "%"
}

variable "tags" {
  type    = map
  default = null
}
