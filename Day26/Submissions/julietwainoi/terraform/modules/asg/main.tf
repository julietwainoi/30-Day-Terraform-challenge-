# modules/compute/main.tf
resource "aws_launch_template" "template" {
  name_prefix   = "launch-template"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.app_sg_id]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              echo "<h1> $(hostname)</h1>" > /var/www/html/index.html
              sudo systemctl start httpd
              sudo systemctl enable httpd
              EOF
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name                = "asg"
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = 1
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]
}
