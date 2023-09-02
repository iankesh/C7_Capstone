# Creating 2 Public Subnets in each AZ
resource "aws_subnet" "public" {
  count             = var.net_count
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.10.${1 + count.index}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name                            = "public-subnet-${var.unique_key}-${1 + count.index}"
    Creator                         = var.creator
    Unique_Key                      = var.unique_key
    Course_Assignment               = var.course_assignment
    "kubernetes.io/cluster/my-eks-201" = "shared"
    "kubernetes.io/role/elb"        = "1"
  }
}

# Creating 2 Private Subnets in each AZ
resource "aws_subnet" "private" {
  count             = var.net_count
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.10.${3 + count.index}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name                            = "private-subnet-${var.unique_key}-${1 + count.index}"
    Creator                         = var.creator
    Unique_Key                      = var.unique_key
    Course_Assignment               = var.course_assignment
    "kubernetes.io/cluster/my-eks-201" = "shared"
    "kubernetes.io/role/elb"        = "1"
  }
}