# Provider configuration for the dev environment.
terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Phase 1: local state. Phase 2: migrate to S3.
  # backend "s3" { ... }  # Uncommented in Phase 2
}

provider "aws" {
  region = var.aws_region
  profile = "terraform"

  default_tags {
    tags = {
      Project     = "platform-lab"
      Environment = "dev"
      ManagedBy   = "terraform"
    }
  }
}