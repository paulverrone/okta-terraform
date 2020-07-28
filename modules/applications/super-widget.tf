resource "okta_app_oauth" "oidc_sample" {
  status         = "ACTIVE"
  label          = "OIDC Demo Application"
  type           = "web"
  redirect_uris  = ["https://super-widget.oktaprise.com"]
  login_uri      = "https://super-widget.oktaprise.com"
  grant_types    = ["implicit", "authorization_code", "refresh_token"]
  response_types = ["code", "token", "id_token"]
  consent_method = "TRUSTED"
  lifecycle {
    ignore_changes = [users, groups]
  }
}
