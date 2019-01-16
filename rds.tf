resource "aws_db_subnet_group" "terraform-dbgroup" {
  name       = "terraform-dbgroup"
  subnet_ids = ["${aws_subnet.private-subnet1.id}" , "${aws_subnet.private-subnet2.id}"]

  tags = {
    Name = "My Terraform DB subnet group"
  }
}

variable "Database_name" {}
variable "Username" {}
variable "password" {}


resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  identifier           = "my-terraform-db"
  name                 = "${var.Database_name}"
  username             = "${var.Username}"
  password             = "${var.password}"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.terraform-dbgroup.name}"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  skip_final_snapshot = true
  final_snapshot_identifier = "teraformdb-final-snap"

  tags {
  Name = "Teraform-mysql"
  }
}


