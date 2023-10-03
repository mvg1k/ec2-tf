variable "access_key" {
  description = "access key"
  type        = string
  default     = "XXXXX"
}

variable "secret_key" {
  description = "secret key"
  type        = string
  default     = "XXXXX"
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"  
}

variable "ami" {
  type        = string
  default     = "ami-04cb4ca688797756f"
}

variable "subnet_id" {
  type        = string
  default     = "subnet-02170bfea3f035bab"
}