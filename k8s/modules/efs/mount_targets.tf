resource "aws_efs_mount_target" "first_mount" {
  file_system_id = aws_efs_file_system.nextcloud_efs.id
  subnet_id = var.first_subnet
  security_groups = [ aws_security_group.allow_nfs.id ]
}


resource "aws_efs_mount_target" "second_mount" {
  file_system_id = aws_efs_file_system.nextcloud_efs.id
  subnet_id = var.second_subnet
  security_groups = [ aws_security_group.allow_nfs.id ]
}
