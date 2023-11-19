terraform {
  required_version = ">=1.5.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0, <5.0.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">=4.0.4"
    }
  }
}

provider "aws" {
  region     = "eu-central-1"
  access_key = "AKIAYDDRM52WFMRRDYPG"
  secret_key = "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"
}
