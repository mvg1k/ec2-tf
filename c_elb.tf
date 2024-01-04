#CLASSIC ELB
resource "aws_elb" "secret_classic_elb" {
  name               = "secret-classic-elb"
  subnets            = [var.subnet_id]
  security_groups = [module.sg_n_instance.security_group_id_output]
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

  instances                   = [module.sg_n_instance.instance_id_output]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
}