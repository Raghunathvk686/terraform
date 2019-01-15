#Define VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags {
    Name = "Teraform-vpc"
  }
}

#Define Public subent
resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags {
    Name = " Public subnet"
  }
}

#Define Private subnet
resource "aws_subnet" "private-subnet1" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1e"

  tags {
    Name = " Private1 subnet"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1f"

  tags {
    Name = " Private2 subnet"
  }
}
