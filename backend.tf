terraform {
  backend "s3" {
    bucket = "tf_buket_hg049884"
    key = "remote.tfstate"
    region = "us-east-2"
  }
}
