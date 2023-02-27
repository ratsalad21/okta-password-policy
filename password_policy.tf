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

# To exclude users, you need to provide the ID
# 00u247ilzed3UnKb75d7 == Matt Everhart
# Need a separate resource if excluding users
resource "okta_policy_rule_password" "test-default-exclude-users" {
  count = var.env == "prd" ? 1 : 0
  policy_id          = okta_policy_password.test-policy.id
  name               = "Default"
  status             = "ACTIVE"
  network_connection = "ANYWHERE"
  users_excluded     = ["00u28oxttt78Nu1WA5d7"]
}

# No excluded users in Dev
resource "okta_policy_rule_password" "test-default" {
  count = var.env == "dev" ? 1 : 0
  policy_id          = okta_policy_password.test-policy.id
  name               = "Default"
  status             = "ACTIVE"
  network_connection = "ANYWHERE"
}



