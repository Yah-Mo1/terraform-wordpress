terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }

    vault = {
      source = "hashicorp/vault"
      version = "4.7.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

# provider "vault" {
#   # Configuration options
# }