# Add Okta provider
terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
      version = "~> 3.6"
    }
  }
}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}
