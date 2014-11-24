name "jruby_runtime"
description "User level RVM and rubies install"

all_env = [
  "role[base]",
  "role[java_dev_runtime]",
  "role[ruby_runtime]"
]

run_list(all_env)

env_run_lists(
  "_default" => all_env,
  "production" => all_env,
  "staging" => all_env,
  "development" => all_env
)

override_attributes(
  "rvm" => {
    "user_installs" => [
      { "user" =>           "vagrant",
        "install_rubies" => true,
        "default_ruby" =>   "jruby-1.7.16.1",
        "rubies" =>         [],
        "global_gems" =>    [{"name" => "bundler"}] }
    ]
  }
)