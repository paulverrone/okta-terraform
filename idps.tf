# Providers

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

# Routing Rules
# Okta has a built-in, uneditable routing policy.  As such, you need to find the object before you can create a routing rule, since all rules
# must be associated with a policy.
data okta_policy idp_discovery_policy {
  name = "Idp Discovery Policy"
  type = "IDP_DISCOVERY"
}

resource okta_policy_rule_idp_discovery idp_routing_rule_google {
  policyid             = data.okta_policy.idp_discovery_policy.id
  priority             = 1
  name                 = "Sign in with Google"
  idp_type             = "GOOGLE"
  idp_id               = $(resource.okta_idp_social.google.id)
  user_identifier_type = "IDENTIFIER"

  user_identifier_patterns {
    match_type = "SUFFIX"
    value      = "gmail.com"
  }
}
