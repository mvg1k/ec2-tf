variable "access_key" {
  description = "access key"
  type        = string
  default     = "AKIAQYP2UC7ITG2EWXHW"
}

variable "secret_key" {
  description = "secret key"
  type        = string
  default     = "N2THVV6/xLvX3tx2OYqwp0z+U30E7zzeGHMU1o2e"
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"  # type of your instance
}

variable "ami" {
  type        = string
  default     = "ami-04cb4ca688797756f"
}

variable "subnet_id" {
  type        = string
  default     = "subnet-02170bfea3f035bab"
}