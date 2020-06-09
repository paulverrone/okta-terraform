resource "okta_app_secure_password_store" "corporate_twitter" {
  label          = "Twitter - Shared Corporate Account"
  preconfigured_app = "twitter"
  credentials_scheme = "SHARED_USERNAME_AND_PASSWORD"
  shared_username = "iatcore"
  shared_password = "t+#_d!VhM$N2j@JS"
}
