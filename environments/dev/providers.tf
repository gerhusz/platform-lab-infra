# Provider configuration for the dev environment.
terraform {
  required_version = "~> 1.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "platform-lab-terraform-state-438776351648"
    key          = "dev/terraform.tfstate"
    region       = "eu-central-1"
    profile      = "terraform"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "platform-lab"
      Environment = "dev"
      ManagedBy   = "terraform"
    }
  }
}
