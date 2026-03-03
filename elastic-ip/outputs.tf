output "elastic_ip" {
  description = "The allocated Elastic IP address"
  value       = aws_eip.rai_main.public_ip
}

output "public_dns" {
  description = "The stable public DNS hostname for the Elastic IP"
  value       = aws_eip.rai_main.public_dns
}

output "allocation_id" {
  description = "EIP allocation ID (needed to release it manually if ever required)"
  value       = aws_eip.rai_main.id
}
