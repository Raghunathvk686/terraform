output "Database Name" {
  description = "Database name "
  value       = "${aws_db_instance.default.name}"
}

output "Username" {
  description = "Database User "
  value       = "${aws_db_instance.default.username}"
}


output "Password" {
  description = "Database Password "
  value       = "${aws_db_instance.default.password}"
}


output "Database Host" {
  description = "Database Host address "
  value       = "${aws_db_instance.default.endpoint}"
}

output "webserver" {
  description = "Webserver address"
  value = "${aws_instance.wb.public_ip}"
}