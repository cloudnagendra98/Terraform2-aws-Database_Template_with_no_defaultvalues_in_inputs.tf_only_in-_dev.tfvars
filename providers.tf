terraform {
  required_providers {
    aws = {
      version = ">= 5.52.0"
      source  = "hashicorp/aws"
    }


  }
  required_version = ">= 1.8.4"

}

provider "aws" {
  region = "us-west-1"

}