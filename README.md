[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/terraform-aws-ses-catchall)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.15.0-blue.svg)

## Description

Create an SES Catchall for one-to-many domains and publish them to a S3 bucket, which will notify a SNS topic

## Usage

```hcl
module "catchall_live" {
  source = "scaffoldly/ses-catchall/aws"

  bucket_name_prefix   = "emails-live"
  read_only_principals = data.aws_iam_role.serverless_emails_api.arn
  domains              = ["emails.mydomain.com"]
  rule_set_name        = "primary"
  after                = "live-bounce-noreply"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.49.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | scaffoldly/s3-private-versioned/aws | 0.15.6 |

## Resources

| Name | Type |
|------|------|
| [aws_ses_receipt_rule.recipt_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_receipt_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_after_rule"></a> [after\_rule](#input\_after\_rule) | Place the catchall after this rule | `string` | n/a | yes |
| <a name="input_bucket_name_prefix"></a> [bucket\_name\_prefix](#input\_bucket\_name\_prefix) | The prefix of the bucket name. SNS topics will also include this name. | `string` | n/a | yes |
| <a name="input_domains"></a> [domains](#input\_domains) | The list of domains to forward to S3 + SNS | `list(string)` | n/a | yes |
| <a name="input_read_only_principals"></a> [read\_only\_principals](#input\_read\_only\_principals) | The ARNs that have read-only access to the bucket | `list(string)` | `[]` | no |
| <a name="input_rule_set_name"></a> [rule\_set\_name](#input\_rule\_set\_name) | The rule set name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | n/a |
| <a name="output_topic_arns"></a> [topic\_arns](#output\_topic\_arns) | n/a |
<!-- END_TF_DOCS -->
