variable "bucket_name_prefix" {
  type        = string
  description = "The prefix of the bucket name. SNS topics will also include this name."
}

variable "read_only_principals" {
  type        = list(string)
  default     = []
  description = "The ARNs that have read-only access to the bucket"
}

variable "domains" {
  type        = list(string)
  description = "The list of domains to forward to S3 + SNS"
}

variable "rule_set_name" {
  type        = string
  description = "The rule set name"
}

variable "after_rule" {
  type        = string
  description = "Place the catchall after this rule"
}
