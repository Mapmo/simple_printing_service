provider "aws" {
  region = "eu-west-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "simple-printing-service"
    key    = "simple_printing_service.tfstate"
    region = "eu-west-1"
  }
}
