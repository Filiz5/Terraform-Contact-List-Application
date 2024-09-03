terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "contactlist-backend-melis"
    key = "env/prod/tf-remote-backend.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt = true
  }
}


module "contactlist" {
  source   = "../modules"
  git-user = "Filiz5"
  key-name = "Meliskey"
  hosted-zone = "datastreamcenter.com"
  env = "prod"
}

output "websiteurl" {
  value = module.contactlist.websiteurl
}