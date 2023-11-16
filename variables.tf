data "aws_ami" "latest_free_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}
variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}


variable "Path_to_ssh" {
  type    = string
  default = "./keys/my_aws_key.pub"
}
