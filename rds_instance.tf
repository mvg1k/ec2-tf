resource "aws_db_subnet_group" "myapp_db_subnet_group" {
 name      = "myapp-db-subnet-group"
 subnet_ids = [var.pub_subnet_a_id, var.pub_subnet_b_id]
}

resource "aws_db_instance" "myapp_db" {
db_subnet_group_name = aws_db_subnet_group.myapp_db_subnet_group.name
 identifier = "myapp-db"
 engine    = "mysql"
 engine_version = "5.7"
 instance_class = var.type
 allocated_storage = 20
 username = "admin"
 password = "password"
 parameter_group_name = "default.mysql5.7"
 publicly_accessible = false
 skip_final_snapshot = true
}
