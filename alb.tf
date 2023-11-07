resource "aws_lb" "myapp-alb" {
 name              = "myapp-lb"
 internal          = false
 load_balancer_type = "application" 
 security_groups   = [var.security_group_id]
 subnets           = [var.pub_subnet_a_id, var.pub_subnet_b_id]
 enable_cross_zone_load_balancing = true
}

resource "aws_lb_target_group" "myapp-alb-tg" {
 name    = "myapp-alb-tg"
 port    = 80
 protocol = "HTTP"
 vpc_id  = var.vpc_id
 health_check {
   healthy_threshold  = 3
   interval           = 30
   unhealthy_threshold = 3
   timeout            = 5
   path               = "/"
   port               = "traffic-port"
 }
}

resource "aws_lb_listener" "alb_listener" {
 load_balancer_arn = aws_lb.myapp-alb.arn
 port             = "80"
 protocol         = "HTTP"
 default_action {
   type            = "forward"
   target_group_arn = aws_lb_target_group.myapp-alb-tg.arn
 }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
 autoscaling_group_name = "packer_ubuntu_asg"
 lb_target_group_arn  = aws_lb_target_group.myapp-alb-tg.arn
}

