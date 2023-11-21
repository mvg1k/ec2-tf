provider "aws" {
  region     = var.region
}

terraform {
  backend "s3" {
    bucket         = "tf-remotestate-mvgik-s3"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}


