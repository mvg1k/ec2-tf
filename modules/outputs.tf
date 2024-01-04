output "security_group_id_output" {
  value = aws_security_group.secret_elb_sg.id
}

output "instance_id_output" {
  value = aws_instance.secret_elb_instance.id
}
