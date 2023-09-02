# Creating an elastic IP
resource "aws_eip" "eip" {
  domain = "vpc"
}

# Creating a NAT Gatway
resource "aws_nat_gateway" "network_interface" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.0.id

  tags = {
    Name              = "nat-${var.unique_key}"
    Creator           = var.creator
    Unique_Key        = var.unique_key
    Course_Assignment = var.course_assignment
  }
  depends_on = [aws_internet_gateway.igw]
}