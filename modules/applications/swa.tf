resource "okta_app_auto_login" "corporate_twitter" {
  label          = "Twitter - Shared Corporate Account"
  preconfigured_app = "twitter"
  credentials_scheme = "SHARED_USERNAME_AND_PASSWORD"
  shared_username = "iatcore"
  shared_password = var.shared_admin_password_swa
  lifecycle {
    ignore_changes = [users, groups]
  }
}

resource "okta_app_auto_login" "corporate_linkedin" {
  label          = "LinkedIn - Shared Corporate Account"
  preconfigured_app = "linkedin"
  credentials_scheme = "SHARED_USERNAME_AND_PASSWORD"
  shared_username = "ripley.dalton@iatcore.com"
  shared_password = var.shared_admin_password_swa
  lifecycle {
    ignore_changes = [users, groups]
  }
}

resource "okta_app_auto_login" "corporate_facebook" {
  label          = "Facebook - Shared Corporate Account"
  preconfigured_app = "facebook"
  credentials_scheme = "SHARED_USERNAME_AND_PASSWORD"
  shared_username = "iatcore"
  shared_password = var.shared_admin_password_swa
  lifecycle {
    ignore_changes = [users, groups]
  }
}

/* Need to determine how to specify Github Organization Name
resource "okta_app_auto_login" "github" {
  label          = "GitHub Team"
  preconfigured_app = "github team"
  credentials_scheme = "EDIT_USERNAME_AND_PASSWORD"
  reveal_password = true
  lifecycle {
    ignore_changes = [groups]
  }
}
*/
