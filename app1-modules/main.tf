module "server1" {
  source = "../modules/ec2" # .. means go back to the previous folder as you already know sir
  ami = "ami-05c13eab67c5d8861"
  instance_type = "t3.small"
  region = "us-east-1"
  name = "DEV-from module" 
}

output "public-ip" {
  value = module.server1.public_ip
}