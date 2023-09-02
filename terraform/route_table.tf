# Creating a public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name              = "rt-public-${var.unique_key}"
    Creator           = var.creator
    Unique_Key        = var.unique_key
    Course_Assignment = var.course_assignment
  }
}

# Associating public subnets to public route table
resource "aws_route_table_association" "public" {
  count          = var.net_count
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

# Creating a Private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.network_interface.id
  }
  tags = {
    Name              = "rt-private-${var.unique_key}"
    Creator           = var.creator
    Unique_Key        = var.unique_key
    Course_Assignment = var.course_assignment
  }
}
# Associating private subnets to private route table
resource "aws_route_table_association" "private" {
  count          = var.net_count
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}