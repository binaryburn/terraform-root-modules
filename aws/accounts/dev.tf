variable "dev_account_name" {
  type        = "string"
  description = "Dev account name"
  default     = "dev"
}

variable "dev_account_email" {
  type        = "string"
  description = "Dev account email"
}

resource "aws_organizations_account" "dev" {
  name                       = "${var.dev_account_name}"
  email                      = "${var.dev_account_email}"
  iam_user_access_to_billing = "${var.account_iam_user_access_to_billing}"
  role_name                  = "${var.account_role_name}"
}

output "dev_account_arn" {
  value = "${aws_organizations_account.dev.arn}"
}
