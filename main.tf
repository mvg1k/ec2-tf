provider "aws" {
  region     = var.region
}

module "sg_n_instance"{
  source     = "./modules"

}

module "instance"{
  source        = "./modules"
}
