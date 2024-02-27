# terraform-module-ses-smtp-user

Creates IAM credentials (with inline policy) to be used with AWS SES service.

Your [SES identity](https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html) must be verified separately.

Example implementation:
```hcl
module "smtp_user" {
  providers = {
    aws.src = aws
  }
  source = "git@github.com:AcroMedia/terraform-module-ses-smtp-user.git?ref=main"
  username = "smtp_user.foo"
  tags = {
    foo = "bar"
  }
}

output "smtp_username" {
  value = module.smtp_user.smtp_username
}

output "smtp_password" {
  value = module.smtp_user.smtp_password
  sensitive = true
}
```
