
variable "ami_id"{
  type        = string
  default     ="ami-01eccbf80522b562b"
}
variable "type" {
  type        = string
  default     = "t2.micro"
}
variable "subnet_id" {
  type        = string
  default     = "subnet-02170bfea3f035bab"
}

variable "vpc_id" {
  type        = string
  default     = "vpc-00c0c735b7100d454"
}

variable "instance_profile_name" {
  description = "Name of the IAM instance profile"
  type        = string
}
