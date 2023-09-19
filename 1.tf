provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

resource "aws_key_pair" "tf-key" {
  key_name   = "tf-key"
  public_key = file("./id_rsa.pub")
}

resource "aws_security_group" "nginx-sg" {
  name        = "nginx-sg"
  description = "Security group for the nginx EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["ip/mask"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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

resource "aws_instance" "tf_instance" {
  ami           = "ami-04cb4ca688797756f"
  instance_type = "t2.micro"
  subnet_id     = "subnet-02170bfea3f035bab"
  user_data     = filebase64("./provisioning.sh")

  # Посилання на вашу створену сек'юріті групу nginx-sg
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
}

output "instance_ip" {
  value = aws_instance.tf_instance.public_ip
}