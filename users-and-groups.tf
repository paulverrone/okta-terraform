# Create users
resource "okta_user" "okta_terraform_admin" {
    first_name = "Okta"
    last_name  = "Terraform Admin"
    login      = "OktaTerraformAdmin@iatcore.com"
    email      = "OktaTerraformAdmin@iatcore.com"
    status     = "ACTIVE"
    
    lifecycle {
        ignore_changes = [admin_roles, group_memberships]
    }
}

resource "okta_user_admin_roles" "okta_role_super_admin" {
  user_id     = okta_user.okta_terraform_admin.id
  admin_roles = [
    "SUPER_ADMIN",
  ]
}

# Create Okta-mastered group "Okta Service Accounts" and add users
resource "okta_group" "service_accounts" {
    name        = "Okta Service Accounts"
    description = "Group that contains all users that represent Service Accounts"
}

resource "okta_group_memberships" "service_account_group_members" {
  group_id = okta_group.service_accounts.id
  users = [
    okta_user.okta_terraform_admin.id,
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

# Create Okta group rule to add users to the Recruiting group
resource "okta_group_rule" "recruiting_grouprule" {
  name              = "Recruiting"
  status            = "ACTIVE"
  group_assignments = [ okta_group.recruiting_group.id ]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "String.equals(user.department,\"Recruiting\")"
}

# Create Okta group rule to add users to the DMZ Admin Group
resource "okta_group_rule" "dmzadmin_grouprule" {
  name              = "DMZ Admins"
  status            = "ACTIVE"
  group_assignments = [ okta_group.recruiting_group.id ]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "String.equals(user.department,\"DMZ Ops\")"
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
    
# Add everyone group to apps    
resource "okta_app_group_assignment" "assign_oidc_example_all" {
    app_id = module.applications.oidc_superwidget_id 
    group_id = data.okta_group.all_group.id
}
    
resource "okta_app_group_assignment" "assign_customer_portal_all" {
    app_id = module.applications.customer_portal_app_id
    group_id = data.okta_group.all_group.id
}    
