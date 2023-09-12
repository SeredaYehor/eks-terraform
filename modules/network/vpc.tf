resource "aws_vpc" "redmine_vpc" {
   cidr_block           = var.vpc_cidr
   enable_dns_support   = true
   enable_dns_hostnames = true
   
   tags = {
     Name          = "${var.environment}-redmine_vpc"
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


