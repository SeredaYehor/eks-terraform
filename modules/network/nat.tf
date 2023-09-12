resource "aws_eip" "nat" {
  tags = {
    Name          = "${var.environment}-nat"
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

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id	= aws_subnet.public_first_subnet.id
  depends_on	= [aws_internet_gateway.internet_gw]

  tags = {
    Name          = "${var.environment}-nat_gateway"
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

