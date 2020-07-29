resource "okta_user_schema" "isVerified" {
  index       = "isVerified"
  title       = "Is Verified?"
  type        = "boolean"
  description = "Stores whether the user has been verified as a customer"
  master      = "OKTA"
  scope       = "SELF"
}
