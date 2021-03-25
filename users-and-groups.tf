# Create users
resource "okta_user" "okta_terraform_admin" {
    first_name = "Okta"
    last_name  = "Terraform Admin"
    login      = "OktaTerraformAdmin@iatcore.com"
    email      = "OktaTerraformAdmin@iatcore.com"
    status     = "ACTIVE"
    admin_roles = ["SUPER_ADMIN"]
}

# Create Okta-mastered group "Okta Service Accounts" and add users
resource "okta_group" "service_accounts" {
    name        = "Okta Service Accounts"
    description = "Group that contains all users that represent Service Accounts"
    users = [
        "okta_user.okta_terraform_admin.id"
    ]
}

# Create Okta-mastered group "Recruiting" and add users
resource "okta_group" "recruiting_group" {
    name = "Recruiting"
    description = "Group that contains employees that are part of the recruiting department"
}

# Create Okta-mastered group "DMZ Admins" and add users
resource "okta_group" "dmzadmin_group" {
    name = "DMZ Server Admins"
    description = "Group that contains employees that are responsible for DMZ Servers"
}

# Find everyone group
data "okta_group" "all_group" {
    name = "Everyone"    
}

# Add recruiting group to apps
resource "okta_app_group_assignment" "assign_twitter_recruiting" {
  app_id   = module.applications.swa_corporate_twitter_id
  group_id = okta_group.recruiting_group.id
}

resource "okta_app_group_assignment" "assign_facebook_recruiting" {
  app_id   = module.applications.swa_corporate_facebook_id
  group_id = okta_group.recruiting_group.id
}

resource "okta_app_group_assignment" "assign_linkedin_recruiting" {
  app_id   = module.applications.swa_corporate_linkedin_id
  group_id = okta_group.recruiting_group.id
}

resource "okta_app_group_assignment" "assign_oidc_example_all" {
    app_id = module.applications.oidc_superwidget_id 
    group_id = okta_group.all_group.id
}
    
resource "okta_app_group_assignment" "assign_customer_portal_all" {
    app_id = module.applications.customer_portal_app_id 
    group_id = okta_group.all_group.id
}    
