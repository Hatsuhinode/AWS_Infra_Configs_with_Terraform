terraform {
  backend "s3" {
    bucket = "prakanda-s3-remotebackend-state"
    region = "eu-north-1"
    key = "stateFile/terraform.tfstate"
    
  }
}