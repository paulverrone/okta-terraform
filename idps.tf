resource "okta_idp_social" "google" {
  type          = "GOOGLE"
  protocol_type = "OAUTH2"
  name          = "Google IdP"

  scopes = [
    "profile",
    "email",
    "openid"
  ]

  client_id         = var.sso_google_client_id
  client_secret     = var.sso_google_client_secret
  username_template = "idpuser.email"
  #subject_match_type        = "CUSTOM_ATTRIBUTE"
  #subject_match_attribute   = "customfieldId"
}

data okta_policy idp_discovery_policy {
  name = "IDP Discovery Policy"
  type = "IDP_DISCOVERY"
}

resource okta_policy_rule_idp_discovery idp_discovery_policy {
  policyid             = "${data.okta_policy.test.id}"
  priority             = 1
  name                 = "IDP Discovery Policy"
  idp_type             = "GOOGLE"
  user_identifier_type = "IDENTIFIER"

  user_identifier_patterns {
    match_type = "SUFFIX"
    value      = "gmail.com"
  }
}

/*
resource "okta_idp_social" "facebook" {
  type          = "FACEBOOK"
  protocol_type = "OAUTH2"
  name          = "Facebook IdP"

  scopes = [
    "public_profile",
    "email",
  ]

  client_id         = "abcd123"
  client_secret     = "abcd123"
  username_template = "idpuser.email"
}

resource "okta_idp_social" "linkedin" {
  type          = "LINKEDIN"
  protocol_type = "OAUTH2"
  name          = "LinkedIn IDP"

  scopes = [
    "r_liteprofile",
    "r_emailaddress",
  ]

  client_id         = "abcd123"
  client_secret     = "abcd123"
  username_template = "idpuser.email"
}
*/
