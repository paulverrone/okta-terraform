resource "okta_app_auto_login" "corporate_twitter" {
  label          = "Twitter - Shared Corporate Account"
  preconfigured_app = "twitter"
  credentials_scheme = "SHARED_USERNAME_AND_PASSWORD"
  shared_username = "iatcore"
  shared_password = "t+#_d!VhM$N2j@JS"
  lifecycle {
    ignore_changes = [groups]
  }
}

resource "okta_app_auto_login" "corporate_linkedin" {
  label          = "LinkedIn - Shared Corporate Account"
  preconfigured_app = "linkedin"
  credentials_scheme = "SHARED_USERNAME_AND_PASSWORD"
  shared_username = "iatcore"
  shared_password = "t+#_d!VhM$N2j@JS"
  lifecycle {
    ignore_changes = [groups]
  }
}

resource "okta_app_auto_login" "corporate_facebook" {
  label          = "Facebook - Shared Corporate Account"
  preconfigured_app = "facebook"
  credentials_scheme = "SHARED_USERNAME_AND_PASSWORD"
  shared_username = "iatcore"
  shared_password = "t+#_d!VhM$N2j@JS"
  lifecycle {
    ignore_changes = [groups]
  }
}
