resource "aws_iam_policy" "alb_ingress_policy" {
  name   = "ALBIngressControllerIAMPolicy"
  policy = file("${path.module}/policies/alb-ingress-policy.json")
}

resource "aws_iam_role" "alb_ingress_role" {
  name = "ALBIngressControllerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = aws_iam_openid_connect_provider.cluster.url
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringEquals = {
            "${aws_iam_openid_connect_provider.cluster.url}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "alb_ingress_attach" {
  role       = aws_iam_role.alb_ingress_role.name
  policy_arn = aws_iam_policy.alb_ingress_policy.arn
}

resource "aws_lb" "main" {
  name               = var.alb_name
  load_balancer_type = "application"
  subnets            = var.subnet_ids

  security_groups = [var.security_group_id]

  tags = {
    Environment = var.environment
  }
}
