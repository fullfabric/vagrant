name "base"
description "Base role applied to all nodes."

all_env = [
  "recipe[apt]",
  "recipe[locale]"
]

run_list(all_env)

env_run_lists(
  "_default" => all_env, 
  "production" => all_env,
  "staging" => all_env,
  "development" => all_env
)

default_attributes(
)

override_attributes(
)