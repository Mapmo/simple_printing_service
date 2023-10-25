resource "aws_subnet" "private_eu_west_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "eu-west-1a"
}

resource "aws_subnet" "private_eu_west_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "eu-west-1b"
}

resource "aws_subnet" "public_eu_west_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_eu_west_1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = true
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_eu_west_1a.id,
    aws_subnet.private_eu_west_1b.id
  ]
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_eu_west_1a.id,
    aws_subnet.public_eu_west_1b.id
  ]
}

output "subnet_ids" {
  value = [
    aws_subnet.private_eu_west_1a.id,
    aws_subnet.private_eu_west_1b.id,
    aws_subnet.public_eu_west_1a.id,
    aws_subnet.public_eu_west_1b.id
  ]
}
