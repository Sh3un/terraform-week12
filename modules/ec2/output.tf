output "public_ip"{
  value = aws_instance.demo.public_ip
}
output "public-dns" {
  value = aws_instance.demo.public_dns
}
output "instance_id" {
  value = aws_instance.demo.id
}