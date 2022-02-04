provider "huaweicloud" {
  region     = "cn-north-1"
  access_key = "PA7T4YZX7UYMLMIFHQLG"
  secret_key = "8OxOjwnQvSnOAoNVrdmYgZxWS7ALESq0R3SZWfFo"
}

resource "huaweicloud_vpc" "example" {
  name = "terraform_vpc"
  cidr = "192.168.0.0/16"
}

