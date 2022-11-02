resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block

  tags = {
    Name = "${var.environment}-vpc"
  }
}

####################### SUBNET (PUBLIC) ##########################
resource "aws_subnet" "pub_sub1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub_sub1_cidr_block
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${var.environment}-pub-sub-1"
  }
}

resource "aws_subnet" "pub_sub2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub_sub2_cidr_block
  availability_zone       = "${var.region}b"

  tags = {
    Name = "${var.environment}-pub-sub-2"
  }
}

####################### INTERNET GATEWAY ##########################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-igw"
  }
}

####################### ROUTE TABLE ##########################
resource "aws_route_table" "pub_rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.environment}-pub-rtb"
  }
}

####################### ROUTE TABLE ASSOCIATION ##########################
resource "aws_route_table_association" "pub_sub1_rtb_assoc" {
  subnet_id      = aws_subnet.pub_sub1.id
  route_table_id = aws_route_table.pub_rtb.id
}

resource "aws_route_table_association" "pub_sub2_rtb_assoc" {
  subnet_id      = aws_subnet.pub_sub2.id
  route_table_id = aws_route_table.pub_rtb.id
}

####################### SECURITY GROUPS ##########################
resource "aws_security_group" "sg" {
    vpc_id      = aws_vpc.vpc.id
    name        =  "security_group"

    ingress {
        from_port       = 9300
        to_port         = 9300
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    ingress {
        from_port       = 9200
        to_port         = 9200
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    ingress {
        from_port       = 0
        to_port         = 0
        protocol        = "icmp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    
  tags = {

    Name = "${var.environment}-security_group"
  
  }
}
