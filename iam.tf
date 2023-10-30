#CREATING ROLE
resource "aws_iam_role" "secret_elb_role" {
  name = "secret_elb_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
#CREATING POLICY
resource "aws_iam_policy" "secret_manager_policy" {
  name        = "secret-manager-policy"
  description = "access to secrets policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "secretsmanager:GetSecretValue",
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}
#ATTACH POLICY TO ROLE
resource "aws_iam_policy_attachment" "secret_manager_attachment" {
  name       = "secret-manager-policy-attachment"
  policy_arn = aws_iam_policy.secret_manager_policy.arn
  roles      = [aws_iam_role.secret_elb_role.name]
}
