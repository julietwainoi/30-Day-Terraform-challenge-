resource "aws_launch_template" "app" {
  name_prefix   = "app-template-"
  image_id      = var.ami_id
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "blue" {
  count               = var.active_env == "blue" ? 1 : 0
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
  min_size           = 1
  max_size           = 1
  desired_capacity   = 1
  vpc_zone_identifier = [] # Replace with subnet IDs
  name               = "blue-asg"
}

resource "aws_autoscaling_group" "green" {
  count               = var.active_env == "green" ? 1 : 0
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
  min_size           = 1
  max_size           = 1
  desired_capacity   = 1
  vpc_zone_identifier = [] # Replace with subnet IDs
  name               = "green-asg"
}
