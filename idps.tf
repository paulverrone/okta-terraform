# Providers

resource okta_idp_social google {
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

# Routing Rules
data okta_policy idp_discovery_policy {
  name = "Idp Discovery Policy"
  type = "IDP_DISCOVERY"
}

resource okta_policy_rule_idp_discovery idp_routing_rule_google {
  policyid             = data.okta_policy.idp_discovery_policy.id
  priority             = 1
  name                 = "IDP Discovery Policy"
  idp_type             = "GOOGLE"
  idp_id               = data.okta_idp_social.google.id
  user_identifier_type = "IDENTIFIER"

  user_identifier_patterns {
    match_type = "SUFFIX"
    value      = "gmail.com"
  }
}
