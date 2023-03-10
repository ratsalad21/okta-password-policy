data "okta_user_type" "user" {
  name = "user"
}

resource "okta_user_schema_property" "example" {
  index       = "terraformProperty"
  title       = "terraformProperty"
  type        = "string"
  description = "This is a custom property created by terraform"
  master      = "OKTA"
  scope       = "SELF"
  user_type   = "${data.okta_user_type.user.id}"
}

resource "okta_user_schema_property" "example2" {
  index       = "terraformProperty2"
  title       = "terraformProperty2"
  type        = "string"
  description = "This is a custom property created by terraform"
  master      = "OKTA"
  scope       = "SELF"
  user_type   = "${data.okta_user_type.user.id}"
}