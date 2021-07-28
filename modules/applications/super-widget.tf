resource "okta_app_oauth" "okta_super_widget" {
  status         = "ACTIVE"
  label          = "Okta Super Widget"
  type           = "web"
  redirect_uris  = ["https://super-widget.oktaprise.com"]
  login_uri      = "https://super-widget.oktaprise.com"
  grant_types    = ["implicit", "authorization_code", "refresh_token"]
  response_types = ["code", "token", "id_token"]
  consent_method = "TRUSTED"
  refresh_token_rotation = "ROTATE"
  lifecycle {
    ignore_changes = [users, groups]
  }
}
