terraform {
  backend "s3" {
    bucket = "task-1-bucket-terraform-21-feb-2026"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "basic-dynamodb-table"
  }
}