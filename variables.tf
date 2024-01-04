
variable "aws_account_name"{
  type        = string
  default     = "admin"
}
variable "region"{
  type        = string
  default     = "us-east-1"
}
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
