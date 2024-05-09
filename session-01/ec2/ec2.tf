resource "aws_security_group" "roboshop-all" { #this is terraform name for terrform ref only 
  name        = var.sg-name #this name is for aws 
  description = var.sg-description
  # vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow-all-ports"
    cidr_ipv4   = var.cidr_blocks
    from_port   = var.inbound-port
    ip_protocol = "tcp"
    to_port     = var.inbound-port
  }
  egress {
    description = "Allow-all-ports"
    cidr_ipv4   = var.cidr_blocks
    from_port   = 0
    ip_protocol = "-1"
    to_port     = 0
  }
  tags = {
    Name = "roboshop-all-aws"
  }   
}

resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"
  vpc_security_groups = [aws_security_group.roboshop-all.id]
  tags = {
  Name = "HelloWorld"
  }
} 

