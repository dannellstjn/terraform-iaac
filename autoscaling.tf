resource "aws_launch_configuration" "wordpress-launchconfig" {
  name_prefix     = "wordpress-launchconfig"
  image_id        = "ami-03c93d6630a8874c9"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.wordpress.key_name
  security_groups = [aws_security_group.ec2_allow_rule.id]
}

resource "aws_autoscaling_group" "wordpress-autoscaling" {
  name                      = "wordpress-autoscaling"
  vpc_zone_identifier       = [aws_subnet.prod-subnet-public-1.id]
  launch_configuration      = aws_launch_configuration.wordpress-launchconfig.name
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers 	    = ["${aws_elb.wordpressec2-elb.name}"]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}

