# Add Okta provider
provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}

module "auth-servers" {
  source = ".//modules/auth-servers"
  OIDC_Client_Id = okta_app_oauth.oidc_sample.id
}
    
module "applications" {
    source = ".//modules/applications"
}
