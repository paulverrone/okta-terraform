output "oidc_superwidget_id" {
  value = okta_app_oauth.okta_super_widget.id
  }

output "customer_portal_app_id" {
  value = okta_app_oauth.customer_portal.id
  }

output "swa_corporate_linkedin_id" {
  value = okta_app_auto_login.corporate_linkedin.id
  }

output "swa_corporate_twitter_id" {
  value = okta_app_auto_login.corporate_twitter.id
  }

output "swa_corporate_facebook_id" {
  value = okta_app_auto_login.corporate_facebook.id
  }
