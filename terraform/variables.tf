variable "db_username" {
  default = "appuser"
}

variable "db_password" {
  default     = "StrongPassword123!"
  sensitive = true
}

variable "db-name" {
    default = "appdb"
}

variable "key_name" {
    default = "terra-kp"
}

