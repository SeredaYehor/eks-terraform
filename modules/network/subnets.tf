resource "aws_subnet" "public_first_subnet" {
  vpc_id			= aws_vpc.redmine_vpc.id
  cidr_block			= var.public_first_cidr
  map_public_ip_on_launch	= "true"
  availability_zone		= "${var.region}a"

  tags = {
    Name          = "public_first_subnet"
    Created_by    = "terraform"
    Environment   = var.environment
    Logging_level = 0
    Date          = timestamp()
    "kubernetes.io/role/elb" = 1                     //specify if this subnet would be used for load balancer deployment
    "kubernetes.io/cluster/test-cluster" = "owned"   //specify type of cluster (custom)
  }

   lifecycle {
    ignore_changes = [
      tags["Date"],
    ]
  }
}

resource "aws_subnet" "public_second_subnet" {
  vpc_id                        = aws_vpc.redmine_vpc.id
  cidr_block                    = var.public_second_cidr
  map_public_ip_on_launch       = "true"
  availability_zone             = "${var.region}b"

  tags = {
    Name          = "public_second_subnet"
    Created_by    = "terraform"
    Environment   = var.environment
    Logging_level = 0
    Date          = timestamp()
    "kubernetes.io/role/elb" = 1
    "kubernetes.io/cluster/test-cluster" = "owned"
  }

   lifecycle {
    ignore_changes = [
      tags["Date"],
    ]
  }
}

resource "aws_subnet" "private_first_subnet" {
  vpc_id                        = aws_vpc.redmine_vpc.id
  cidr_block                    = var.private_first_cidr
  map_public_ip_on_launch       = "false"
  availability_zone             = "${var.region}a"

  tags = {
    Name          = "private_first_subnet"
    Created_by    = "terraform"
    Environment   = var.environment
    Logging_level = 0
    Date          = timestamp()
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/test-cluster" = "owned"
  }

   lifecycle {
    ignore_changes = [
      tags["Date"],
    ]
  }
}

resource "aws_subnet" "private_second_subnet" {
  vpc_id                        = aws_vpc.redmine_vpc.id
  cidr_block                    = var.private_second_cidr
  map_public_ip_on_launch       = "true"
  availability_zone             = "${var.region}b"

  tags = {
    Name          = "private_second_subnet"
    Created_by    = "terraform"
    Environment   = var.environment
    Logging_level = 0
    Date          = timestamp()
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/test-cluster" = "owned"
  }

   lifecycle {
    ignore_changes = [
      tags["Date"],
    ]
  }
}

