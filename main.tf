module "s3_bucket" {
  source  = "scaffoldly/s3-private-versioned/aws"
  version = "0.15.8"

  bucket_name_prefix = var.bucket_name_prefix

  read_only_principals = var.read_only_principals

  write_only_services = ["ses.amazonaws.com"]

  notification_prefixes = formatlist("%s/", var.domains)
}

resource "aws_ses_receipt_rule" "recipt_rule" {
  count = length(var.domains)

  name          = var.domains[count.index]
  rule_set_name = var.rule_set_name
  after         = var.after_rule
  recipients    = [var.domains[count.index]]
  enabled       = true
  scan_enabled  = true

  s3_action {
    bucket_name       = module.s3_bucket.bucket_name
    object_key_prefix = "${var.domains[count.index]}/"
    position          = 1
  }
}
