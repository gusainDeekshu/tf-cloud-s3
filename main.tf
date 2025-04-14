terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
  }
}

provider "aws" {
     # Configuration options
  region = var.region  
}

resource "random_id" "random_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "terraform-cloud-bucket-id-${random_id.random_id.hex}"
}


output "name" {
  value = random_id.random_id.b64_url
}