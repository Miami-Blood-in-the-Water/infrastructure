provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "miamimush-terraform"
    key    = "miami.tfstate"
    region = "us-east-1"
  }
}
