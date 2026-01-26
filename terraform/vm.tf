# Frontend EC2 (Public)
resource "aws_instance" "frontend" {
  ami                         = "ami-0abcdef1234567890"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "frontend"
    Role = "frontend"
  }
}

# Backend EC2 (Private)
resource "aws_instance" "backend" {
  ami                    = "ami-0abcdef1234567890"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "backend"
    Role = "backend"
  }
}
