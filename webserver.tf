data "aws_ami" "centos" {
  owners      = ["679593333241"]
  most_recent = true
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "template_file" "cloud-config" {
  template = <<YAML
#cloud-config
runcmd:
 - yum install httpd -y
 - rm -rf /var/www/html/index.html
 - cd /var/www/html
 - service httpd start
 - yum install git -y 
 - yum install php -y 
 - setenforce 0
 - yum install php-mysql -y
 - yum install telnet -y
 - yum install mysql -y
 - git clone https://github.com/Raghunathvk686/Wordpress.git
 - mv /var/www/html/Wordpress/* /var/www/html
 - mv /var/www/html/httpd.conf /etc/httpd/conf/httpd.conf
 - chown -R apache. /var/www/html
 - rm -rf /var/www/html/Wordpress
 - rm -rf /usr/share/httpd/noindex/index.html
 - service httpd restart
YAML
}

resource "aws_instance" "wb" {
   ami  = "${data.aws_ami.centos.id}"
   instance_type = "t2.micro"
   associate_public_ip_address = true
   source_dest_check = false
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.sg.id}"]
   user_data = "${base64encode(data.template_file.cloud-config.rendered)}"
   tags {
   Name = "webserver"
  }
}
