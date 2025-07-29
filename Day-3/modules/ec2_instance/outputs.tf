output "public_ip_address" {
    value = aws_instance.example.public_ip // use aws_eip if you have elastic IP, since public ip might change
}