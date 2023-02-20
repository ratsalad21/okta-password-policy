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

resource "okta_group" "test4" {
  name        = "Test4"
  description = "This is test group 4"
}

# resource "okta_group" "test5" {
#   name        = "Test5"
#   description = "This is test group 5"
# }

resource "okta_group_rule" "test1-rule" {
  name              = "Test1 Rule"
  status            = "ACTIVE"
  group_assignments = [okta_group.test1.id]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "String.startsWith(user.lastName,\"Everhart\")"
}

resource "okta_group_rule" "test3-rule" {
  name              = "Test3 Rule"
  status            = "ACTIVE"
  group_assignments = [okta_group.test3.id]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "isMemberOfGroup(\"${okta_group.test1.id}\")"
}