# Add Okta provider
provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}

module "auth-server-customer" {
  source = "../modules/auth-servers"
}
