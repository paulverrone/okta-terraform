# Custom MFA Enrollment Policy and rule
resource "okta_policy_mfa" "recruiting_mfa_policy" {
  name        = "Recruiting MFA"
  status      = "ACTIVE"
  description = "MFA enrollment policy for Recruiting"

  okta_otp = {
    enroll = "REQUIRED"
  }

  google_otp = {
    enroll = "NOT_ALLOWED"
  }
  
   okta_call = {
    enroll = "NOT_ALLOWED"
  } 

  groups_included = ["data.okta_group.recruiting_group.id"]
  
  depends_on = [
    "okta_factor.factor_okta_verify",
    "okta_factor.factor_okta_call",
    "okta_factor.factor_google_authenticator"
  ]
}

resource okta_policy_rule_mfa marketing_mfa {
  policyid           = "okta_policy_mfa.recruiting_mfa_policy.id"
  name               = "MFA Enrollment"
  status             = "ACTIVE"
  enroll             = "LOGIN"
  network_connection = "ZONE"
  network_excludes   = ["okta_network_zone.blacklisted_countries.id"]
}


# Custom sign-on policies
resource "okta_policy_signon" "signon_always_mfa" {
  name            = "Always MFA"
  status          = "ACTIVE"
  description     = "Always MFA for a subset of users"
  groups_included = ["data.okta_group.dmzadmin_group.id"]
}

resource "okta_policy_rule_signon" "signon_rule_always_mfa" {
  policyid = "okta_policy_signon.signon_always_mfa.id"
  name     = "Always MFA"
  status   = "ACTIVE"
  mfa_required = "true"
  mfa_prompt = "SESSION"
}
