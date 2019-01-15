#Define security group

resource "aws_security_group" "sg" {
  name = "vpc_test_web"
  vpc_id = "${aws_vpc.main.id}"
  description = "Allow incoming HTTP connections & SSH access $ DB"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["10.0.1.0/24"]  #public subnet cidr block
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags {
    Name = " Teraform SG"
  }
}
