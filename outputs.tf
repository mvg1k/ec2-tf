output "instance_ip" {
  value = aws_instance.tf_instance.public_ip
  description = "Public ip of created instance"
}