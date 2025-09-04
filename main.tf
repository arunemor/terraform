provider "aws" {
    region = var.region
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "upload" {
  bucket = "s3policies-${random_id.suffix.hex}"
 
  tags = {
    Name = "${random_id.suffix.hex}"
  }
}

resource "aws_s3_object" "upload_file" {
     bucket = "s3policies-${random_id.suffix.hex}"
     key = "cicd pipeline.jpeg"
     source = "/home/ubuntu/Downloads/learn-terraform/s3/cicd pipeline.jpeg"
}


