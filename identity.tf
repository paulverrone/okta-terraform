variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}

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
    
data "okta_user" "okta_terraform_admin" {
   search {
       name = profile.firstName
       value = "Okta"
   }
   search {
       name = profile.lastName
       value = "Terraform Admin"
   }
}


resource "okta_group" "service_accounts" {
    name        = "Okta Service Accounts"
    description = "Groups that contains all users that represent Service Accounts"
    users = [
        "${okta_user.okta_terraform_admin.id}"
    ]
}
