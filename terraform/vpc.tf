# Creating the VPC
resource "aws_vpc" "this" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name              = "vpc-${var.unique_key}"
    Creator           = var.creator
    Unique_Key        = var.unique_key
    Course_Assignment = var.course_assignment
  }
}