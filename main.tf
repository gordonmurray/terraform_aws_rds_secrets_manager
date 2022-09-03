terraform {

  required_version = "1.2.8"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"

    }
  }

}

provider "aws" {
  region  = "eu-west-1"
  profile = "default"

  default_tags {
    tags = {
      App = "terraform_aws_rds_secrets_manager"
    }
  }
}
