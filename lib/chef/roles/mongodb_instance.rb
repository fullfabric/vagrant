name "mongodb_instance"
description "MongoDB singel instance install"

all_env = [
  "role[base]",
  "recipe[mongodb-10gen::single]"
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