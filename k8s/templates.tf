resource "local_file" "efs" {
  filename = "efs.yaml"
  content = templatefile("efs.yaml.tpl", {
    fs-id = module.efs.fs-id
  })
}

resource "local_file" "nextcloud" {
  filename = "nextcloud.yaml"
  content = templatefile("nextcloud.yaml.tpl", {
    database_password = var.database_password
    database_endpoint = var.database_endpoint
    admin_password    = var.admin_password
    trusted_domain    = var.trusted_domain
    certificate_arn   = var.certificate_arn
  })
}
