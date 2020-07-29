resource "okta_app_oauth" "customer_portal" {
  status         = "ACTIVE"
  label          = "Customer Portal"
  type           = "web"
  redirect_uris  = ["https://localhost:44369/signin-oidc", "https://localhost:44369/Customer"]
  login_uri      = "https://localhost:44369/signin-oidc"
  grant_types    = ["client_credentials", "authorization_code"]
  response_types = ["code"]
  consent_method = "TRUSTED"
  lifecycle {
    ignore_changes = [users, groups]
  }
}
