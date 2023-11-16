resource "aws_instance" "jenkins_server" {
  ami           = data.aws_ami.latest_free_ami.id
  instance_type = var.ec2_instance_type
}


resource "aws_key_pair" "generated_key" {
  key_name   = "my_aws_key"
  public_key = file(var.Path_to_ssh)
}


#------------------------------------------------------------------- 
resource "aws_security_group" "my_security_group" {
  name        = "Dynamic-my-security-group"
  description = "My Security Group"
  dynamic "ingress" {
    for_each = ["80", "22", "8080"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraformVpc"
  }
}
