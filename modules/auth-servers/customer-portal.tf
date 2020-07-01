resource "okta_auth_server" "customer_portal" {
  audiences   = ["api://iatcore.com"]
  description = "Auth Server that handles customer-facing apps"
  name        = "Customer Portal"
  issuer_mode = "ORG_URL"
  status      = "ACTIVE"
}

resource "okta_auth_server_scope" "account_read" {
  auth_server_id = okta_auth_server.customer_portal.id
  consent        = "REQUIRED"
  description    = "This allows the app to view your IATCore account information."
  name           = "iat.account.read"
  # Need ability to set the displayname for the scope
}

resource "okta_auth_server_claim" "test" {
  auth_server_id = okta_auth_server.customer_portal.id
  name           = "staff"
  value          = "String.substringAfter(user.email, \"@\") == \"example.com\""
  scopes         = ["${okta_auth_server_scope.account_read.name}"]
  claim_type     = "IDENTITY"
}

resource "okta_auth_server_policy" "default_policy" {
  auth_server_id   = okta_auth_server.customer_portal.id
  status           = "ACTIVE"
  name             = "test policy"
  description      = "update"
  priority         = 1
  client_whitelist = ["${var.OIDC_Client_Id}"]
}

data "okta_group" "everyone" {
  name = "Everyone"
}

resource "okta_auth_server_policy_rule" "default_rule" {
  auth_server_id       = okta_auth_server.customer_portal.id
  policy_id            = okta_auth_server_policy.default_policy.id
  status               = "ACTIVE"
  name                 = "test rule"
  priority             = 1
  group_whitelist      = ["${data.okta_group.everyone.id}"]
  grant_type_whitelist = ["authorization_code", "password", "implicit"]
  scope_whitelist      = ["*"]
}
