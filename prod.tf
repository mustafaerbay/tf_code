provider "aws" {
  profile                 = "default"
  region                  = "us-west-2"
  shared_credentials_file = "/root/terraform/.aws/credentials"
}

resource "aws_s3_bucket" "prod_tf_course" {
  bucket_prefix = "anatolman-tf-course"
  acl           = "private"
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "prod_web" {
  name        = "prod_web"
  description = "Allow standart http and https ports inbound and everything outbound"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0" ]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0" ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0" ]
  }

  tags = {
    "Terraform" : "true"
  }

}

resource "aws_instance" "prod_web" {
  ami           = "ami-03a0cd500c36e8f3c"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    aws_security_group.prod_web.id
  ]
  
  tags = {
    "Terraform" : "true"
  }
}


