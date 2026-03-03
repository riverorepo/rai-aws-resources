###############################################################################
# EC2 instance — RAI-AICLI (rai-main)
#
# COST NOTE:
#   - t3.medium on-demand: ~$0.0416/hr (~$30/mo) while running
#   - Instance is free while stopped; EBS volume continues to accrue cost
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
# Import — brings the existing instance under Terraform management
###############################################################################

import {
  to = aws_instance.rai_main
  id = var.instance_id
}

###############################################################################
# EC2 Instance
###############################################################################

resource "aws_instance" "rai_main" {
  ami                  = var.ami
  instance_type        = var.instance_type
  key_name             = var.key_name
  subnet_id            = var.subnet_id
  iam_instance_profile = var.iam_instance_profile

  vpc_security_group_ids = var.vpc_security_group_ids

  ebs_optimized = true

  credit_specification {
    cpu_credits = "unlimited"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 30
    iops                  = 3000
    throughput            = 125
    delete_on_termination = true
    encrypted             = false
  }

  tags = {
    Name      = var.name
    ManagedBy = "terraform"
  }

  lifecycle {
    # Prevent accidental replacement of the running instance
    prevent_destroy = true
    # user_data and AMI changes are handled via separate processes
    ignore_changes = [ami, user_data]
  }
}
