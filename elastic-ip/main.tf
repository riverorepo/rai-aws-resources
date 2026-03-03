###############################################################################
# Elastic IP + Association for the RAI EC2 instance
#
# COST WARNING:
#   - EIP is FREE while associated with a running instance
#   - EIP costs ~$0.005/hr (~$3.60/mo) when the instance is stopped
#   - EIP costs ~$0.005/hr if allocated but unassociated
#   - Release this EIP (terraform destroy) when no longer needed
###############################################################################

terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

###############################################################################
# Data — look up the existing EC2 instance
###############################################################################

data "aws_instance" "rai_main" {
  instance_id = var.instance_id
}

###############################################################################
# Elastic IP
###############################################################################

resource "aws_eip" "rai_main" {
  domain = "vpc"

  tags = {
    Name    = var.name
    ManagedBy = "terraform"
  }
}

###############################################################################
# Associate EIP with the EC2 instance
###############################################################################

resource "aws_eip_association" "rai_main" {
  instance_id   = data.aws_instance.rai_main.id
  allocation_id = aws_eip.rai_main.id
}
