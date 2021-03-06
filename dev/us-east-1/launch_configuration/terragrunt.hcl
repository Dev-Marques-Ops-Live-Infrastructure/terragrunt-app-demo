terraform {
  source = "../../../../terraform-app-demo/application/launch_configuration/"
}

include {
  path = find_in_parent_folders()
}

dependency "tags" {
  config_path = "../tags"

  mock_outputs_allowed_terraform_commands = ["plan","apply"]
}

dependency "key_pair" {
  config_path = "../key_pair"
}

dependency "security_groups" {
  config_path = "../security_groups"
}

#dependency "rds" {
#  config_path = "../rds"
#}

inputs = {

  tags = {
    account_id  = dependency.tags.outputs.commons.account_id
    email       = dependency.tags.outputs.commons.email
  }

  prefix_name = dependency.tags.outputs.prefix_name

  key_pair_name     = dependency.key_pair.outputs.key_pair_name
  security_group_id = dependency.security_groups.outputs.app_vm_security_group_id
}