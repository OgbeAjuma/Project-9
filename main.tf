#VPC

resource "aws_vpc" "project-9" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = "Project-9"
  }
}

# Public Subnets

resource "aws_subnet" "pubsub-01" {
  vpc_id     = aws_vpc.project-9.id
  cidr_block = var.public-sub-01
  availability_zone="eu-west-2a"
  map_public_ip_on_launch="true"

  tags = {
    Name = "pubsub-01"
  }
}

resource "aws_subnet" "pubsub-02" {
  vpc_id     = aws_vpc.project-9.id
  cidr_block = var.public-sub-02
  availability_zone="eu-west-2b"
  map_public_ip_on_launch="true"

  tags = {
    Name = "pubsub-02"
  }
}

#private submets 
resource "aws_subnet" "privsub-01" {
  vpc_id     = aws_vpc.project-9.id
  cidr_block = var.private-sub-01
  availability_zone="eu-west-2c"
  map_public_ip_on_launch="true"

  tags = {
    Name = "privsub-1"
  }
}

resource "aws_subnet" "privsub-02" {
  vpc_id     = aws_vpc.project-9.id
  cidr_block = var.private-sub-02
  availability_zone="eu-west-2a"
  map_public_ip_on_launch="true"

  tags = {
    Name = "privsub-02"
  }
}

#Route table

resource "aws_route_table" "publicrt01" {
  vpc_id = aws_vpc.project-9.id

  tags = {
    Name = "publicrt01"
  }
}

resource "aws_route_table" "privatert01" {
  vpc_id = aws_vpc.project-9.id

  route = []

  tags = {
    Name = "privatert01"
  }
}
#IGW


resource "aws_route_table_association" "pubrt-asso01" {
  subnet_id      = aws_subnet.pubsub-01.id
  route_table_id = aws_route_table.publicrt01.id
}

resource "aws_route_table_association" "pubrt-asso02" {
  subnet_id      = aws_subnet.pubsub-02.id
  route_table_id = aws_route_table.publicrt01.id
}

resource "aws_route_table_association" "privrt-asso01" {
  subnet_id      = aws_subnet.privsub-01.id
  route_table_id = aws_route_table.privatert01.id
}

resource "aws_route_table_association" "privrt-asso02" {
  subnet_id      = aws_subnet.privsub-02.id
  route_table_id = aws_route_table.privatert01.id
}


resource "aws_internet_gateway" "igw-project9" {
  vpc_id = aws_vpc.project-9.id

  tags = {
    Name = "igw-project9"
  }
}

resource "aws_route" "igw-rtasso" {
  route_table_id = aws_route_table.publicrt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.igw-project9.id
}