resource "okta_inline_hook" "validate_client_id" {
  name    = "Validate Client ID"
  version = "1.0.1"
  type    = "com.okta.user.pre-registration"

  channel = {
    version = "1.0.0"
    uri     = "https://iatcoreapim.azure-api.net/okta/registration"
    method  = "POST"
  }

  auth = {
    key   = "Authorization"
    type  = "HEADER"
    value = "1234"
  }
}
