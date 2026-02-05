# Frontend EC2 (Public)
resource "aws_instance" "frontend" {
  ami                         = "ami-06e3c045d79fd65d9"
  instance_type               = "t2.micro"
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
  ami                    = "ami-06e3c045d79fd65d9"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name


  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y && sudo apt upgrade -y
              sudo apt-get update -y &&
              sudo apt-get install -y python3 python3-apt
              EOF

  tags = {
    Name = "backend"
    Role = "backend"
  }
}
