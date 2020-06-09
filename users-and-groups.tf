# Create users
/*
resource "okta_user" "okta_terraform_admin" {
    first_name = "Okta"
    last_name  = "Terraform Admin"
    login      = "OktaTerraformAdmin@iatcore.com"
    email      = "OktaTerraformAdmin@iatcore.com"
    status     = "ACTIVE"
    admin_roles = ["SUPER_ADMIN"]
}
*/

# Find existing user "Okta Terraform Admin"    
data "okta_user" "okta_terraform_admin" {
   search {
       name = "profile.firstName"
       value = "Okta"
   }
   search {
       name = "profile.lastName"
       value = "Terraform Admin"
   }
}

# Create Okta-mastered group "Okta Service Accounts" and add users
resource "okta_group" "service_accounts" {
    name        = "Okta Service Accounts"
    description = "Group that contains all users that represent Service Accounts"
    users = [
        "${data.okta_user.okta_terraform_admin.id}"
    ]
}

# Find and add "recruiting" group to "twitter"
data "okta_group" "recruiting_group" {
    name = "D_Recruiting"    
}

resource "okta_app_group_assignment" "assign_twitter_recruiting" {
  app_id   = "resource.okta_app_auto_login.twitter.id"
  group_id = "data.okta_group.recruiting_group.id"
}
