
output "raw_bucket_name" {
  description = "Name of the S3 bucket used for raw data storage"
  value       = aws_s3_bucket.raw.bucket
}

output "github_actions_role_arn" {
  description = "ARN of the IAM role used by GitHub Actions"
  value       = aws_iam_role.github_actions_role.arn
}
