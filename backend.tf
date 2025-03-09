terraform {
  backend "s3" {
    bucket = "exam1617"
    key = "remote.tfstate"
    region = "ap-south-1a"
  }
}
