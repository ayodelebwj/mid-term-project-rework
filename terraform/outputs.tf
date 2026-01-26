output "frontend_ip" {
  value = aws_instance.frontend.private_ip
}

output "backend_ip" {
  value = aws_instance.backend.private_ip
}

output "db_endpoint" {
  value = aws_db_instance.postgres.address
}

output "db_username" {
  value = var.db_username
}

output "db_password" {
  value     = var.db_password
  sensitive = true
}

output "db-name" {
    value = var.db-name
}
