# Remote state — uncomment and configure once you have an S3 bucket + DynamoDB table
# terraform {
#   backend "s3" {
#     bucket         = "rai-tfstate-bucket"
#     key            = "ec2/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }

# For now, state is stored locally in terraform.tfstate (gitignored).
# IMPORTANT: Do not lose terraform.tfstate — it is needed to manage/destroy this instance.
