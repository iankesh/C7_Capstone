resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name              = "igw-${var.unique_key}"
    Creator           = var.creator
    Unique_Key        = var.unique_key
    Course_Assignment = var.course_assignment
  }
}