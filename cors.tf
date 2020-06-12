resource "okta_trusted_origin" "super_widget" {
  name   = "super-widget"
  origin = "https://super-widget.oktaprise.com"
  scopes = ["CORS", "REDIRECT"]
}
