resource "aws_iam_group" "group1" {
  name = "DevOps"
}


resource "aws_instance" "didi" {
  ami           = data.aws_ami.ami1.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key.key_name
  depends_on    = [aws_key_pair.ec2_key, aws_iam_group.group1]
}

resource "null_resource" "null" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = "week12b.pem"
    host        =  aws_instance.didi.public_dns            #self.public_ip used if directly under an instance
  }

  provisioner "local-exec" {
    command = "echo hello"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "mkdir sh3un",
      "pwd",
      "nproc"
    ]
  }
  provisioner "file" {
    source      = "week12b.pem"
    destination = "/tmp/myfile.pem"
  }
}