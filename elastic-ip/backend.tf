terraform {
  backend "s3" {
    bucket         = "rai-tfstate-bucket"
    key            = "elastic-ip/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
