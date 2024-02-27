resource "aws_iam_user" "smtp_user" {
  provider = aws.src
  name = var.username
  tags = var.tags
}

resource "aws_iam_access_key" "smtp_user" {
  provider = aws.src
  user = aws_iam_user.smtp_user.name
}

data "aws_iam_policy_document" "ses_sender" {
  statement {
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "ses_sender" {
  provider = aws.src
  name        = "ses_sender"
  policy      = data.aws_iam_policy_document.ses_sender.json
  tags = var.tags
  user = aws_iam_user.smtp_user.name
}
