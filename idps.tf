resource "okta_idp_social" "google" {
  type          = "GOOGLE"
  protocol_type = "OAUTH2"
  name          = "Google IdP"

  scopes = [
    "public_profile",
    "email",
  ]

  client_id         = var.sso_google_client_id
  client_secret     = var.sso_google_client_secret
  username_template = "idpuser.email"
  match_type        = "CUSTOM_ATTRIBUTE"
  match_attribute   = "customfieldId"
}
