terraform {
  backend "s3" {
    bucket         = "aws-platform-terraform-s3-tfstate"
    key            = "prod/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "aws-platform-terraform-dynamodb-tfstate"
    encrypt        = true
  }
}