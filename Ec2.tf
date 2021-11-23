resource "aws_instance" "webserver1-proj9" {
  ami           = var.Ami-id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG-proj9.id]
  subnet_id =  aws_subnet.pubsub-01.id
  availability_zone = "eu-west-2a"
  user_data         = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}

resource "aws_instance" "webserver2-proj9" {
  ami           = var.Ami-id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG-proj9.id ]
  subnet_id =  aws_subnet.pubsub-02.id
  availability_zone = "eu-west-2b"

  tags = {
    Name = "HelloWorld-user"
  }
}