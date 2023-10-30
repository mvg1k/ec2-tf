#SECURITY GROUP
resource "aws_security_group" "secret_elb_sg" {
  name        = "secret_elb_sg"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
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
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


#INSTANCE
resource "aws_instance" "secret_elb_instance" {
  ami           = var.ami_id
  instance_type = var.type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.secret_elb_sg.id]
  user_data = filebase64("./provisioning.sh")
  iam_instance_profile = aws_iam_instance_profile.secret_elb_profile.name
}
