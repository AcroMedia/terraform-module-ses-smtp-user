variable "username" {
  type = string
  description = "The username for the SMTP user"
}

variable "tags" {
  type = map(string)
  description = "Environment-specific (billing) tags to be applied to resources that accept tags"
  default = {}
}
