terraform {
    backend "s3" {
        region         = "ap-south-1"
        bucket         = "prem-s3-demo-xyz"
        key            = "prem/terraform.tfstate"
        dynamodb_table = "terraform_lock"
    }
}