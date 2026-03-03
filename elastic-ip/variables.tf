variable "region" {
  description = "AWS region where the EC2 instance lives"
  type        = string
  default     = "us-east-1"
}

variable "instance_id" {
  description = "ID of the EC2 instance to attach the Elastic IP to"
  type        = string
  default     = "i-0aa0c1e19392592dc"
}

variable "name" {
  description = "Name tag applied to the Elastic IP"
  type        = string
  default     = "rai-main"
}
