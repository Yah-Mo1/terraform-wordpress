terraform {
  backend "s3" {
    bucket = "tf-wordpress-state-bucket"
    key    = "state/terraform.tfstate"

    region = "eu-west-2"
  }
}
