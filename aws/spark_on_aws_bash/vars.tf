variable "aws_profile" {}
variable "home_ip" {}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = "map"
  default = {
  us-east-1 = "ami-04681a1dbd79675a5"
  us-east-2 = "ami-05958c30a2c6a7b68"
  }
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "../../../tf_keys/mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "../../../tf_keys/mykey.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
variable "vpc_id" {
  default = "vpc-11882474"
}