name "development_box"
description "Installs development tools and libs"

all_env = [
  "role[base]",
  "recipe[packages::default]"
]

run_list(all_env)

env_run_lists(
  "_default" => all_env,
  "production" => all_env,
  "staging" => all_env,
  "development" => all_env
)

default_attributes(
  "packages" => ["git", "libgd2-xpm-dev", "wkhtmltopdf", "unzip"]
)