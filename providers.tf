# Add Okta provider
terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 3.10"
    }
  }
}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}

module "auth-servers" {
    source = ".//modules/auth-servers"
    OIDC_Client_Id = module.applications.oidc_superwidget_id
    Customer_Portal_App_Id = module.applications.customer_portal_app_id
    #org_name = var.org_name
    #base_url = var.base_url
    #api_token = var.api_token
}
    
module "applications" {
    source = ".//modules/applications"
    shared_admin_password_swa = var.shared_admin_password_swa
    azure_apim_endpoint = var.azure_apim_endpoint
    #org_name = var.org_name
    #base_url = var.base_url
    #api_token = var.api_token
}
