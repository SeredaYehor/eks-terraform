resource "aws_db_instance" "nextcloud_database" {
  allocated_storage      = "30"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  identifier             = "nextcloud"
  db_name                = "nextcloud_db"
  username               = "worker"
  password               = var.database_password
  db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids = [ aws_security_group.rds_sg.id ]
  publicly_accessible    = false
  skip_final_snapshot    = true
  multi_az               = false

  tags = {
    Name          = "nextcloud_database"
    Created_by    = "terraform"
    Environment   = var.environment
    Logging_level = 1
    Date          = timestamp()
  }

   lifecycle {
    ignore_changes = [
      tags["Date"],
    ]
  }
}
