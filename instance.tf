#INSTANCE PROFILE
resource "aws_iam_instance_profile" "secret_elb_profile" {
  name = "secret_elb_profile"
  role = aws_iam_role.secret_elb_role.name
}

#INSTANCE
resource "aws_instance" "secret_elb_instance" {
  ami           = var.ami_id
  instance_type = var.type
  subnet_id     = var.subnet_id
  user_data = filebase64("./provisioning.sh")
  iam_instance_profile = aws_iam_instance_profile.secret_elb_profile.name
}
