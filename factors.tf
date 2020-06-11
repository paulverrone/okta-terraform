/*
resource "okta_factor" "factor_okta_verify" {
  provider = okta_otp
}

resource "okta_factor" "factor_okta_push" {
  provider = okta_push
}

resource "okta_factor" "factor_okta_call" {
  provider = okta_call
}

resource "okta_factor" "factor_okta_email" {
  provider = okta_email
}
*/
  
resource "okta_factor" "factor_google_authenticator" {
  provider = google_otp
}
