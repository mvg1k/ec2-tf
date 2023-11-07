
variable "aws_account_name"{
  type        = string
  default     = "admin"
}
variable "region"{
  type        = string
  default     = "us-east-1"
}
variable "type" {
  type        = string
  default     = "db.t2.micro"
}
variable "pub_subnet_a_id" {
  type        = string
  default     = "subnet-09b927761e699edf7"
}

variable "pub_subnet_b_id" {
  type        = string
  default     = "subnet-0649bc848358c2b12"
}

variable "vpc_id" {
  type        = string
  default     = "vpc-049a70758b23c6260"
}
variable "security_group_id" {
  type        = string
  default     = "sg-082ba26dacb154a4c"
}