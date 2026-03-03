output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.rai_main.id
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = aws_instance.rai_main.private_ip
}

output "public_ip" {
  description = "Public IP address (Elastic IP if associated)"
  value       = aws_instance.rai_main.public_ip
}

output "instance_state" {
  description = "Current state of the instance"
  value       = aws_instance.rai_main.instance_state
}

output "iam_instance_profile" {
  description = "IAM instance profile attached to the instance"
  value       = aws_instance.rai_main.iam_instance_profile
}
