name "java_dev_runtime"
description "32 Bit Oracle JDK"

all_env = [
  "role[base]",
  "recipe[java]"
]

run_list(all_env)

env_run_lists(
  "_default" => all_env,
  "production" => all_env,
  "staging" => all_env,
  "development" => all_env
)

default_attributes(
  "java" => {
    "jdk_version" => "8",
    "install_flavor" => "oracle",
    "oracle" => { "accept_oracle_download_terms" => true }
  }
)