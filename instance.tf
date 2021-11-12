#Get Linux AMI ID using filter endpoint in us-east-1
/*data "aws_ami" "ubuntu" {
  provider    = aws.region-master
  most_recent = true


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}*/


#Create key-pair for logging into EC2 in us-east-1
resource "aws_key_pair" "master-key" {
  provider   = aws.region-master
  key_name   = "lamp-key"
  public_key = file("~/.ssh/id_rsa.pub")
}



#Create and bootstrap EC2 in us-east-1
resource "aws_instance" "lamp-master" {
  provider                    = aws.region-master
  ami                         = "ami-083654bd07b5da81d"
  instance_type               = var.instance-type
  key_name                    = aws_key_pair.master-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.lamp-sg.id]
  subnet_id                   = aws_subnet.subnet_1.id
  user_data                   = file("install-lamp-ubuntu.sh")

  tags = {
    Name = "lamp_master_tf"
  }
  depends_on = [aws_main_route_table_association.set-master-default-rt-assoc]
}




 