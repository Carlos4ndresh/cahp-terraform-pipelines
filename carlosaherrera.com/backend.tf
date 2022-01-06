terraform {
  backend "s3" {
    bucket         = "terraform-cahpsite-state-bucket"
    key            = "cahp_site_pipeline.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-lock-table"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.70"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      "Env"         = "prod",
      "Owner"       = "cherrera",
      "Provisioner" = "terraform",
      "Project"     = "Personal Website"
    }
  }
}