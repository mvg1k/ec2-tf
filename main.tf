provider "aws" {
  region     = var.region
}

module "sg_n_instance"{
  source     = "./modules"
  instance_profile_name = aws_iam_instance_profile.secret_elb_profile.name
}
