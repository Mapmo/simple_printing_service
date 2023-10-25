resource "aws_eip" "nat" {
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_eu_west_1a.id

  depends_on = [aws_internet_gateway.igw]
}
