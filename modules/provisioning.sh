#!/bin/bash
secret_value = $( aws secretsmanager get-secret-value --secret-id secret_elb --output json --region us-east-1)

sudo echo $secret_value >> /home/ec2-user/secret.env