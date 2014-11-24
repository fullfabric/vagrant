name "ruby_runtime"
description "User level RVM and rubies install"

all_env = [
  "role[base]",
  "recipe[rvm::user]",
  "recipe[rvm::vagrant]"
]

run_list(all_env)

env_run_lists(
  "_default" => all_env,
  "production" => all_env,
  "staging" => all_env,
  "development" => all_env
)

default_attributes(
  "rvm" => {
    "user_installs" => [
      { "user" =>           "vagrant",
        "install_rubies" => true,
        "default_ruby" =>   "2.1.4",
        "rubies" =>         [],
        "global_gems" =>    [{"name" => "bundler"}] }
    ]
  }
)