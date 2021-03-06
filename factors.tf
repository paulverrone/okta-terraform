
resource "okta_factor" "factor_okta_verify" {
  provider_id = "okta_otp"
}

resource "okta_factor" "factor_okta_push" {
  provider_id = "okta_push"
}

resource "okta_factor" "factor_okta_call" {
  provider_id = "okta_call"
}

resource "okta_factor" "factor_okta_question" {
  provider_id = "okta_question"
}

resource "okta_factor" "factor_okta_sms" {
  provider_id = "okta_sms"
}

/* Provider does not support this factor type yet
resource "okta_factor" "factor_okta_email" {
  provider_id = "okta_email"
}
*/
  
resource "okta_factor" "factor_google_authenticator" {
  provider_id = "google_otp"
}
