# modules/alb/main.tf
resource "aws_lb" "app" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [var.alb_sg_id]
}

resource "aws_lb_target_group" "target" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

 default_action {
  type             = "forward"
  target_group_arn = aws_lb_target_group.target.arn
}

}
