resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.redmine_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = {
    Name          = "${var.environment}-public_route_table"
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

resource "aws_route_table_association" "public_first_rta" {
  subnet_id	 = aws_subnet.public_first_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_second_rta" {
  subnet_id      = aws_subnet.public_second_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.redmine_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name          = "${var.environment}-private_route_table"
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

resource "aws_route_table_association" "private_first_rta" {
  subnet_id         = aws_subnet.private_first_subnet.id
  route_table_id    = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_second_rta" {
  subnet_id      = aws_subnet.private_second_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
