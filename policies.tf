# Custom sign-on policies
resource "okta_policy_signon" "signon_always_mfa" {
  name            = "Always MFA"
  status          = "ACTIVE"
  description     = "Always MFA for a subset of users"
  groups_included = ["${data.okta_group.everyone.id}"]
}

resource "okta_policy_rule_signon" "signon_rule_always_mfa" {
  policyid = "${okta_policy_signon.signon_always_mfa.id}"
  name     = "Always MFA"
  status   = "ACTIVE"
}
