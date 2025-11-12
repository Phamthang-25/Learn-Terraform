provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = file("./keypair/mykey.pub")
}

resource "aws_instance" "demo-instance" {
  ami           = "ami-0cae6d6fe6048ca2c"
  instance_type = "t3.micro"
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
