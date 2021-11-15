terraform {

  required_version = "0.14.10"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "3.43.0"

    }
  }

}

# Configure the AWS Provider
provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}
