# scale up alarm

resource "aws_autoscaling_policy" "wordpressec2-cpu-policy" {
  name                   = "wordpressec2-cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.wordpress-autoscaling.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "wordpressec2-cpu-alarm" {
  alarm_name          = "wordpressec2-cpu-alarm"
  alarm_description   = "wordpressec2-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.wordpress-autoscaling.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.wordpressec2-cpu-policy.arn]
}

# scale down alarm
resource "aws_autoscaling_policy" "wordpress-cpu-policy-scaledown" {
  name                   = "wordpress-cpu-policy-scaledown"
  autoscaling_group_name = aws_autoscaling_group.wordpress-autoscaling.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "wordpress-cpu-alarm-scaledown" {
  alarm_name          = "wordpress-cpu-alarm-scaledown"
  alarm_description   = "wordpress-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.wordpress-autoscaling.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.wordpress-cpu-policy-scaledown.arn]
}

