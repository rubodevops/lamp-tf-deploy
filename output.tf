output "Lamp-Main-Node-Public-IP" {
  value = aws_instance.lamp-master.public_ip

}

/*output "amiId-us-east-1" {
  value     = data.aws_ami.ubuntu.id
  sensitive = false
}*/