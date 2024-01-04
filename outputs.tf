output "aws_account_name" {
  value = var.aws_account_name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.secret_elb_profile.name
}

