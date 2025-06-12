provider "aws" {
  region = "us-east-1"
}

# Create Security Group
resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Allow HTTP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create Launch Templates
resource "aws_launch_template" "blue" {
  name_prefix   = "blue-template"
  image_id      = var.ami_id
  instance_type = "t3.micro"
  security_group_names = [aws_security_group.app_sg.name]
}

resource "aws_launch_template" "green" {
  name_prefix   = "green-template"
  image_id      = var.ami_id
  instance_type = "t3.micro"
  security_group_names = [aws_security_group.app_sg.name]
}

# Target Groups
resource "aws_lb_target_group" "blue" {
  name     = "blue-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "green" {
  name     = "green-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# ALB
resource "aws_lb" "app" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
}

# Listener with traffic switching
resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.blue.arn
        weight = var.active_env == "blue" ? 100 : 0
      }
      target_group {
        arn    = aws_lb_target_group.green.arn
        weight = var.active_env == "green" ? 100 : 0
      }
    }
  }
}

# Auto Scaling Groups
resource "aws_autoscaling_group" "blue" {
  name                 = "blue-asg"
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
  vpc_zone_identifier  = var.subnet_ids
  launch_template {
    id      = aws_launch_template.blue.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.blue.arn]
}

resource "aws_autoscaling_group" "green" {
  name                 = "green-asg"
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
  vpc_zone_identifier  = var.subnet_ids
  launch_template {
    id      = aws_launch_template.green.id
    version = "$Latest"
  }
  target_group_arns = [aws_lb_target_group.green.arn]
}
