resource "okta_auth_server" "customer_portal" {
  audiences   = ["api://iatcore.com"]
  description = "Auth Server that handles customer-facing apps"
  name        = "Customer Portal"
  issuer_mode = "ORG_URL"
  status      = "ACTIVE"
}

/*
resource "okta_auth_server_claim" "test" {
  auth_server_id = "${okta_auth_server.test.id}"
  name           = "test"
  status         = "ACTIVE"
  claim_type     = "RESOURCE"
  value_type     = "EXPRESSION"
  value          = "cool"
}

resource "okta_auth_server_scope" "test" {
  auth_server_id = "${okta_auth_server.test.id}"
  consent        = "REQUIRED"
  description    = "This is a scope"
  name           = "test:something"
}

resource "okta_auth_server_policy" "test" {
  auth_server_id   = "${okta_auth_server.test.id}"
  status           = "ACTIVE"
  name             = "test"
  description      = "update"
  priority         = 1
  client_whitelist = ["${okta_app_oauth.test.id}"]
}

data "okta_group" "everyone" {
  name = "Everyone"
}

resource "okta_auth_server_policy_rule" "test" {
  auth_server_id       = "${okta_auth_server.test.id}"
  policy_id            = "${okta_auth_server_policy.test.id}"
  status               = "ACTIVE"
  name                 = "test"
  priority             = 1
  group_whitelist      = ["${data.okta_group.everyone.id}"]
  grant_type_whitelist = ["password", "implicit"]
}
*/
