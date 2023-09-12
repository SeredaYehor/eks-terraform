resource "aws_iam_policy" "aws-load-balancer-controller" {
  policy = file("modules/eks/iam-policy.json") #alb works properly only with this iam-policy
  name   = "AWSLoadBalancerController"
}

resource "aws_iam_role_policy_attachment" "aws_load_balancer_controller_attach" {
  role       = aws_iam_role.aws-load-balancer-controller.name
  policy_arn = aws_iam_policy.aws-load-balancer-controller.arn
}
