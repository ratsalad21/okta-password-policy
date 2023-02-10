resource "okta_policy_password" "test-policy" {
  name                   = "Test Policy"
  status                 = "ACTIVE"
  description            = "Example"
  password_history_count = 4
  groups_included        = ["${data.okta_group.everyone.id}"]
}



