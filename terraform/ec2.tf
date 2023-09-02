# # Create the key pair
# resource "aws_key_pair" "deployer" {
#   key_name   = "key-pair-${var.unique_key}"
#   public_key = file("../id_rsa.pub")
# }

# # Create Bastion EC2 instance
# resource "aws_instance" "bastion" {
#   ami                         = data.aws_ami.amazon_ubuntu.id
#   key_name                    = aws_key_pair.deployer.key_name
#   instance_type               = "t2.micro"
#   subnet_id                   = aws_subnet.public.0.id
#   vpc_security_group_ids      = [aws_security_group.bastion_host.id]
#   associate_public_ip_address = true

#   tags = {
#     Name              = "Bastion-Instance-${var.unique_key}"
#     Creator           = var.creator
#     Unique_Key        = var.unique_key
#     Course_Assignment = var.course_assignment
#   }
# }

# # Create Jenkins EC2 instance
# resource "aws_instance" "jenkins" {
#   ami                    = data.aws_ami.amazon_ubuntu.id
#   key_name               = aws_key_pair.deployer.key_name
#   instance_type          = "t2.micro"
#   subnet_id              = aws_subnet.private.0.id
#   vpc_security_group_ids = [aws_security_group.private_instance.id]
#   #   associate_public_ip_address = true

#   tags = {
#     Name              = "Jenkins-Instance-${var.unique_key}"
#     Creator           = var.creator
#     Unique_Key        = var.unique_key
#     Course_Assignment = var.course_assignment
#   }
# }

# # Create App EC2 instance
# resource "aws_instance" "app" {
#   ami                         = data.aws_ami.amazon_ubuntu.id
#   key_name                    = aws_key_pair.deployer.key_name
#   instance_type               = "t2.micro"
#   subnet_id                   = aws_subnet.private.1.id
#   vpc_security_group_ids      = [aws_security_group.private_instance.id]
#   associate_public_ip_address = false

#   tags = {
#     Name              = "App-Instance-${var.unique_key}"
#     Creator           = var.creator
#     Unique_Key        = var.unique_key
#     Course_Assignment = var.course_assignment
#   }
# }