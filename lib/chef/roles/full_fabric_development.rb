name "full_fabric_development"
description "FULL FABRIC development dependencies and settings"

all_env = [
  "role[base]",
  "recipe[hosts_file::custom_entries]"
]

run_list(all_env)

env_run_lists(
  "_default" => all_env,
  "production" => all_env,
  "staging" => all_env,
  "development" => all_env
)

override_attributes(
  "hosts_file" => {
    "custom_entries" => {
      "127.0.0.1" => %w(tbs.fullfabric.dev ggsb.fullfabric.dev thelisbonmba.fullfabric.dev)
    }
  }
)