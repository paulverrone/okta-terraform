resource "okta_app_oauth" "azure_apim" {
  status         = "ACTIVE"
  label          = "Azure API Management"
  type           = "web"
  redirect_uris  = [var.azure_apim_endpoint]
  #post_logout_redirect_uris = ["https://localhost:44369"]
  #login_uri      = "https://localhost:44369/signin-oidc"
  grant_types    = ["client_credentials", "authorization_code"]
  response_types = ["code"]
  consent_method = "TRUSTED"
  refresh_token_rotation = "ROTATE"
  lifecycle {
    ignore_changes = [users, groups]
  }
}
