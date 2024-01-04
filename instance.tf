#INSTANCE PROFILE
resource "aws_iam_instance_profile" "secret_elb_profile" {
  name = "secret_elb_profile"
  role = aws_iam_role.secret_elb_role.name
}
