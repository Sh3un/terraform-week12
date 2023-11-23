terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
  profile = "default"
}

locals {
  env = "dev"
}

output "my-var" {
  value = local.env
}
// calling week7 code from github
module "name" {
  source = "github.com/Sh3un/terraform-week7"
}