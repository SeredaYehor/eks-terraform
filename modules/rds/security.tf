resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "SG for RDS MySQL"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name          = "${var.environment}-rds-security-group"
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
