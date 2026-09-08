terraform {
  required_version = ">= 1.10.0" # use_lockfile (native S3 locking) requires >= 1.10

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

