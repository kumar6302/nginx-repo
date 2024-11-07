output "vpc_id" {
  value = aws_vpc.main.id  # Assuming aws_vpc.main is your VPC resource
}

output "subnet_ids" {
  value = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]  # Adjust this as per your subnet resource names
}
