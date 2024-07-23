terraform {

  required_version = "1.9.2"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "5.56.0"
    }
  }

}

provider "aws" {
  region  = "eu-west-1"
  profile = "gordonmurray"

  default_tags {
    tags = {
      App = "terraform_aws_rds_secrets_manager"
    }
  }
}
