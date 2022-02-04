provider "aws" {
  profile = "default"
  region = "us-west-2"
  shared_credentials_file = "/root/terraform/.aws/credentials"
}

resource "aws_s3_bucket" "tf_course" {
  bucket = "tf-course-20220204"
  acl = "private"
}
