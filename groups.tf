resource "okta_group" "test1" {
  name        = "Test1"
  description = "This is test group 1"
}

resource "okta_group" "test2" {
  name        = "Test2"
  description = "This is test group 2"
}

resource "okta_group" "test3" {
  name        = "Test3"
  description = "This is test group 3"
}

resource "okta_group_rule" "test3-rule" {
  name              = "example"
  status            = "ACTIVE"
  group_assignments = [
    "${okta_group.test2.id}"]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "isMemberOfGroup("okta_group.test1.id")"
}