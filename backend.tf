terraform {
  backend "s3" {
    bucket = "fornewstate"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "for_state_lock"
    encrypt = true
  }
}