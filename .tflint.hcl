# https://github.com/terraform-linters/tflint-ruleset-terraform/tree/main/docs/rules
plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

config {
  disabled_by_default = false
}

rule "terraform_typed_variables" {
  enabled = true
}

rule "terraform_required_providers" {
  enabled = true
}

rule "terraform_comment_syntax" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}
 rule "terraform_documented_variables" {
  enabled = true
 }

rule "terraform_naming_convention" {
  enabled = true
}
