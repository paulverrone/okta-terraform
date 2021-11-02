# Country code list: https://en.wikipedia.org/wiki/ISO_3166-2

resource "okta_network_zone" "blacklisted_countries" {
  name     = "Blacklisted Countries"
  type     = "DYNAMIC"
  dynamic_locations = [
  "AF",
  "IR",
  "KP"
  ]
}

resource "okta_network_zone" "corporate_locations" {
  name     = "Corporate Locations1"
  type     = "DYNAMIC"
  dynamic_locations = [
  "BS",
  "JM"
  ]
}
