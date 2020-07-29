resource "okta_app_oauth" "azure_apim" {
  status         = "ACTIVE"
  label          = "Azure API Management"
  type           = "web"
  redirect_uris  = ["null/docs/services/okta-default-openid-connect-iatcore-preview/console/openidconnect/authorizationcode/callback"]
  #post_logout_redirect_uris = ["https://localhost:44369"]
  #login_uri      = "https://localhost:44369/signin-oidc"
  grant_types    = ["client_credentials", "authorization_code"]
  response_types = ["code"]
  #consent_method = "TRUSTED"
  lifecycle {
    ignore_changes = [users, groups]
  }
}
