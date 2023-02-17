data "okta_group" "everyone" {
  name = "Everyone"
}

resource "okta_policy_password" "test-policy" {
  name                   = "Test Policy"
  status                 = "ACTIVE"
  description            = "Example"
  password_history_count = 4
  groups_included        = [data.okta_group.everyone.id]
}

resource "okta_policy_rule_password" "test-default" {
  policy_id          = okta_policy_password.test-policy.id
  name               = "Default"
  status             = "ACTIVE"
  network_connection = "ANYWHERE"
  users_excluded     = var.env == "dev" ? ["Matthew Everhart"] : [""]
}



