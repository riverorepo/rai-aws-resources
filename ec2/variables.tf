variable "region" {
  description = "AWS region where the instance lives"
  type        = string
  default     = "us-east-1"
}

variable "instance_id" {
  description = "ID of the existing EC2 instance to import"
  type        = string
  default     = "i-0aa0c1e19392592dc"
}

variable "name" {
  description = "Name tag for the instance"
  type        = string
  default     = "RAI-AICLI"
}

variable "ami" {
  description = "AMI ID used to launch the instance"
  type        = string
  default     = "ami-0b6c6ebed2801a5cb"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "RubenCloudops"
}

variable "subnet_id" {
  description = "Subnet to launch the instance in"
  type        = string
  default     = "subnet-7656f111"
}

variable "iam_instance_profile" {
  description = "IAM instance profile to attach"
  type        = string
  default     = "rai-role-ec2"
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to attach"
  type        = list(string)
  default     = ["sg-075faf996bbc0d18b"]
}
