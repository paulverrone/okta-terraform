resource "okta_user_schema" "isVerified" {
  index       = "isVerified"
  title       = "Is Verified?"
  type        = "boolean"
  description = "Stores whether the user has been verified as a customer"
  master      = "OKTA"
  scope       = "SELF"
}

resource "okta_user_schema" "clientId" {
  index       = "clientId"
  title       = "Client ID"
  type        = "string"
  description = "Stores the customer's account ID"
  master      = "OKTA"
  scope       = "SELF"
}
