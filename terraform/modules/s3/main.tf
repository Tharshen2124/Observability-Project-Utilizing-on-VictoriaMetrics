// create an S3 bucket with a name attach to it
resource "aws_s3_bucket" "primary" {
  bucket = "tharshen-terraform-primary-bucket"
}

/**
 *  defines the lifecycle policy after 20 days, objects from standard 
    storage class is transitioned to glacier storage class
*/
resource "aws_s3_bucket_lifecycle_configuration" "primary_lifecycle" {
  bucket = aws_s3_bucket.primary.id

  rule {
    id     = "transition-to-glacier"
    status = "Enabled"

    transition {
      days          = 20
      storage_class = "GLACIER"
    }
  }
}