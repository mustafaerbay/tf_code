provider "aws" {
  profile = "default"
  region = "us-west-2"
  shared_credentials_file = "/root/terraform/.aws/credentials"
}

resource "aws_s3_bucket" "prod_tf_course" {
  bucket_prefix = "anatolman-tf-course"
  acl = "private"
}

resource "aws_default_vpc" "default" {}
