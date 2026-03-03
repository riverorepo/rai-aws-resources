# Remote state — uncomment and configure once you have an S3 bucket + DynamoDB table
# terraform {
#   backend "s3" {
#     bucket         = "your-tfstate-bucket"
#     key            = "elastic-ip/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }

# For now, state is stored locally in terraform.tfstate (gitignored).
# IMPORTANT: Do not lose terraform.tfstate — it is needed to manage/destroy this EIP.
