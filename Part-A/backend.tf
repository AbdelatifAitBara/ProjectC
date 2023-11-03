terraform {
  backend "s3" {
    bucket = "abdelatif-s3"
    region = "eu-west-1"
    key    = "abdelatif-part-a.tfstate"
  }
}
