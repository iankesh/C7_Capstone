# # Create Security Group for Bastion Host
# resource "aws_security_group" "bastion_host" {
#   name        = "bastion-host-sg-${var.unique_key}"
#   description = "bastion-host-sg"
#   vpc_id      = aws_vpc.this.id

#   ingress {
#     description = "Public"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name              = "Bastion-Host-SG-${var.unique_key}"
#     Creator           = var.creator
#     Unique_Key        = var.unique_key
#     Course_Assignment = var.course_assignment
#   }
# }

# # Create Security Group for Private Instance
# resource "aws_security_group" "private_instance" {
#   name        = "private-instance-sg-${var.unique_key}"
#   description = "private-instance-sg"
#   vpc_id      = aws_vpc.this.id

#   ingress {
#     description = "Private"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = [aws_vpc.this.cidr_block]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name              = "Private-Instance-SG-${var.unique_key}"
#     Creator           = var.creator
#     Unique_Key        = var.unique_key
#     Course_Assignment = var.course_assignment
#   }
# }

# # Create Security Group for Public Web
# resource "aws_security_group" "public_web" {
#   name        = "public-web-sg-${var.unique_key}"
#   description = "public-web-sg"
#   vpc_id      = aws_vpc.this.id

#   ingress {
#     description = "Public"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name              = "Public-Web-SG-${var.unique_key}"
#     Creator           = var.creator
#     Unique_Key        = var.unique_key
#     Course_Assignment = var.course_assignment
#   }
# }