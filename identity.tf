# Set variables
variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

# Add Okta provider
provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}

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

# Configure recommended sign-on, MFA, and password policies

# Configure sign-on and MFA policy for "Okta Service Accounts" group

# Configure API Authorization Server

# Set up common apps
