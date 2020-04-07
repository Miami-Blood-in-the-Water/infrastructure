resource "aws_lb" "miami" {
  name               = "miami"
  internal           = false
  load_balancer_type = "network"
  subnets = [
  "subnet-1bc7da7c"]
}

resource "aws_lb_target_group" "http" {
  name        = "miami-http"
  port        = 4001
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = "vpc-5ce8c126"
}

resource "aws_lb_target_group" "ws" {
  name        = "miami-ws"
  port        = 4002
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = "vpc-5ce8c126"
}

resource "aws_lb_target_group" "telnet" {
  name        = "miami-telnet"
  port        = 4000
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = "vpc-5ce8c126"
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.miami.arn
  port              = "4001"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
}

resource "aws_lb_listener" "ws" {
  load_balancer_arn = aws_lb.miami.arn
  port              = "4002"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ws.arn
  }
}

resource "aws_lb_listener" "telnet" {
  load_balancer_arn = aws_lb.miami.arn
  port              = "4000"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.telnet.arn
  }
}