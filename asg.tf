#создание автоскейл групы
resource "aws_autoscaling_group" "my_asg" {
 desired_capacity = 5
 max_size       = 10
 min_size       = 2
 launch_template {
   id     = var.launch_template_id
 }
 vpc_zone_identifier = [var.pub_subnet_a_id]
}
#создание аларма по метрике цпу, если больше половины- аларм и создание нового инстанса
# аларм экшнс при создании аларма ссылается к далее созданной политике асг, которая и создаёт инстанс  
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
 alarm_name         = "cpu_alarm"
 comparison_operator = "GreaterThanOrEqualToThreshold"
 evaluation_periods = "2"
 metric_name        = "CPUUtilization"
 namespace          = "AWS/EC2"
 period             = "60"
 statistic          = "Average"
 threshold          = "50"
 alarm_description  = "This metric checks cpu utilization"
 alarm_actions      = [aws_autoscaling_policy.my_asg_policy.arn]
}
#политика которая создаёт новый инстанс
resource "aws_autoscaling_policy" "my_asg_policy" {
 name                 = "my_asg_policy"
 autoscaling_group_name = aws_autoscaling_group.my_asg.name
 adjustment_type       = "ChangeInCapacity"
 scaling_adjustment    = 1
 cooldown              = 300
}

#расписание, по дефолту стоит UTC, поэтому надо играться со временем как я понял
resource "aws_autoscaling_schedule" "my_schedule" {
  scheduled_action_name  = "my_schedule"
  min_size               = 0
  max_size               = 3
  desired_capacity       = 1
  start_time             = "2023-11-21T22:00:00Z"
  end_time               = "2023-11-21T23:00:00Z"
  autoscaling_group_name = aws_autoscaling_group.my_asg.name
}