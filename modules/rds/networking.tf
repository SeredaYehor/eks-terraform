resource "aws_db_subnet_group" "database_subnet_group" {
  name          = "rds_group"
  subnet_ids    = [ var.first_private_sub_id, var.second_private_sub_id ]

  tags = {
    Name          = "database_subnet_group"
    Created_by    = "terraform"
    Environment   = var.environment
    Logging_level = 0
    Date          = timestamp()
  }

   lifecycle {
    ignore_changes = [
      tags["Date"],
    ]
  }
}
