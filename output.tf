output "bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "topic_arns" {
  value = module.s3_bucket.topic_arns
}