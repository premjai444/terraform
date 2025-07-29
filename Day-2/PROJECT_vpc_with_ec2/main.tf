resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "sub2" {
  vpc_id = aws.vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {`
  vpc_id = aws.vpc.myvpc.vpc_id
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table_association" "rta1" {
  subnet_id = aws_subnet.sub1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id = aws_subnet.sub2.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "webSG" {
  name = "web"
  vpc_id = aws_vpc.myvpc.id

  ingress = {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress = {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "prem-terraform-bucket-2025"
}

resource "aws_instance" "webserver1" {
  ami = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [awas_security_group.webSG.id]
  subnet_id = aws_subnet.sub1.owner_id
  user_data = basr64encode(file("user_data1.sh"))
}

resource "aws_instance" "webserver2" {
  ami = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [awas_security_group.webSG.id]
  subnet_id = aws_subnet.sub2.owner_id
  user_data = basr64encode(file("user_data2.sh"))
}

resource "aws_lb" "myalb" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.webSG.id]
  subnets            = [aws_subnet.sub1.id, aws_subnet.sub2.id]

  enable_deletion_protection = false

  tags = {
    Name = "web"
  }
}



resource "aws_lb_target_group" "tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id

  health_check {
    path                = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "webserver1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.webserver1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "webserver2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.webserver2.id
  port             = 80
}

resource "aws_lb_listener" "web_lb_listener" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
  }
}

output "loadbalancerdns" {
  value = aws_lb.myalb.dns_name
}