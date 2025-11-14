variable "region" {
  type = string
  default = "us-east-1"
}
variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to launch. Example: t2.micro"
  default = "t3.micro"
}
variable "amis" {
  type = map(any)
  default = {
    "us-east-1" : "ami-0cae6d6fe6048ca2c"
    "ap-northeast-1" : "ami-0dfa284c9d7b2adad"
  }
}
variable "keypair_path" {
  type = string
  default = "./keypair/mykey.pub"
  
}
variable "dummy" {
  type = string
  default = "dummy_value"
  
}
