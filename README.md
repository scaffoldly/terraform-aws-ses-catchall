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
  after_rule           = "live-bounce-noreply"
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

## Providers

## Modules

## Resources

## Inputs

## Outputs

<!-- END_TF_DOCS -->
