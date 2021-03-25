# Custom MFA Enrollment Policy and rule
resource "okta_policy_mfa" "recruiting_mfa_policy" {
  name        = "Recruiting MFA"
  status      = "ACTIVE"
  description = "MFA enrollment policy for Recruiting"

  okta_otp = {
    enroll = "REQUIRED"
  }
  
  okta_push = {
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
    okta_factor.factor_okta_verify,
    okta_factor.factor_okta_call,
    okta_factor.factor_google_authenticator
  ]
}

resource okta_policy_rule_mfa marketing_mfa {
  policyid           = okta_policy_mfa.recruiting_mfa_policy.id
  name               = "MFA Enrollment"
  status             = "ACTIVE"
  enroll             = "LOGIN"
  network_connection = "ZONE"
  network_excludes   = ["okta_network_zone.blacklisted_countries.id"]
}


# Custom sign-on policies
resource "okta_policy_signon" "recruiting_signon_policy" {
  name            = "Recruiting"
  status          = "ACTIVE"
  description     = "MFA when not in company location"
  groups_included = ["data.okta_group.dmzadmin_group.id"]
}

resource "okta_policy_rule_signon" "recruiting_signon_rule_mfa" {
  policyid = okta_policy_signon.recruiting_signon_policy.id
  name     = "Always MFA when not in company location"
  status   = "ACTIVE"
  mfa_required = "true"
  mfa_prompt = "DEVICE"
  network_connection = "ZONE"
  network_excludes = ["okta_network_zone.corporate_locations.id"]
}

# Custom app sign-on policies
# Not able to set via Okta provider yet
