terraform {
  backend "s3" {
    bucket = "mustafa.devops77" # Replace with your actual S3 bucket name
    key    = "Prod/terraform.tfstate"
    region = "us-east-2"
  }
}
