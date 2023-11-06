#CLASSIC ELB_test
resource "aws_elb" "secret_classic_elb" {
  name               = "secret-classic-elb"
  subnets            = [var.subnet_id]
  security_groups = [aws_security_group.secret_elb_sg.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [aws_instance.secret_elb_instance.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
}