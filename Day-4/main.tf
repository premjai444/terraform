provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "prem" {
  instance_type = "t2.micro"
  ami           = "ami-0f918f7e67a3323f0"
}


# resource "aws_s3_bucket" "s3_bucket" {
#   bucket = "prem-s3-demo-xyz"
# }

# you need to create s3, then use that s3 in backend.tf

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}