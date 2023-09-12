resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.redmine_vpc.id

  tags = {
    Name          = "${var.environment}-internet_gateway"
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

