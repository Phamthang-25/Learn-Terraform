provider "aws" {
  region = var.region
}

resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = file("./keypair/mykey.pub")
}

resource "aws_instance" "demo-instance" {
  ami           = var.image_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.mykeypair.key_name
  tags = {
    Name = "Demo-IaC"
    Domain = "DevOps"
  }
  vpc_security_group_ids = [aws_security_group.test-security-group.id]
}

resource "aws_security_group" "test-security-group" {
  name        = "test-security-group"
  description = "test-security-group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
